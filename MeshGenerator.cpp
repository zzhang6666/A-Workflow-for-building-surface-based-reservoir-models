/************************************************************************************************************************************************
* This program is for mesh generation given Coons patches and NURBS curves
* Author: Zhao Zhang, Institute of Petroleum Engineering, Heriot-Watt University, UK                                                            *
* Contact: zhao.zhang@hw.ac.uk ; zzhang6666@gmail.com                                                                                           *
*************************************************************************************************************************************************/



#include <Windows.h>
#include<iostream>
#include<fstream>
#include <Windows.h>
#include <string>
#include <vector>
#include"tetgen.h"


extern "C" {
#include"triangle.h"
}

int main(){
	
	std::ifstream inf;
	inf.open("Examples/apaper_mesh/coons/surfaces_papermesh.txt");
	int nsurf, nu, nv;
	std::vector<int> quad, quadmark;
	std::vector<double> xvec, yvec, zvec;
	inf >> nsurf;
	int nquad = 0;
	int nnode = 0;
	double x, y, z;
	for (int isurf = 0; isurf < nsurf; isurf++){
		inf >> nu >> nv;
		for (int j = 0; j < nv; j++){
			for (int i = 0; i < nu; i++){
				inf >> x >> y >> z;
				xvec.push_back(x); yvec.push_back(y); zvec.push_back(z);
			}
		}
		for (int j = 1; j < nv; j++){
			for (int i = 1; i < nu; i++){
				quad.push_back((j - 1)*nu + i - 1+nnode);
				quad.push_back((j - 1)*nu + i+nnode);
				quad.push_back((j)*nu + i+nnode);
				quad.push_back((j)*nu + i - 1+nnode);
				quadmark.push_back(isurf+1);
			}
		}
		nnode = nnode + nu*nv;
	}

	std::ifstream inf2;
	inf2.open("Examples/apaper_mesh/coons/pslg.txt");
	double uu, vv, xconst, yconst;
	int nps, ip1, ip2;
	inf2 >> nps;
	int npoin, nseg;
	char tc[20];
	strcpy(tc, "pqYY");
	int nnode2 = 0;
	std::vector<double> xvec2, yvec2, zvec2;
	std::vector<int> trian, trianmark;
	for (int ips = 0; ips < nps; ips++){
		inf2 >> npoin >> nseg;
		struct triangulateio trianglein, triangleout, trianglevor;
		trianglein.numberofpoints = npoin;
		trianglein.pointlist = new REAL[trianglein.numberofpoints * 2];
		trianglein.pointmarkerlist = NULL;
		trianglein.numberofpointattributes = 0;
		trianglein.numberofholes = 0;
		trianglein.numberofregions = 0;
		trianglein.numberofsegments = nseg;
		trianglein.segmentlist = new int[trianglein.numberofsegments * 2];
		trianglein.segmentmarkerlist = NULL;
		for (int ipoin = 0; ipoin < npoin; ipoin++){
			inf2 >> x >> y >> z;
			if (ips <=1){//front or back so remove y
				uu = x;
				yconst = y;
				vv = z;
			}
			else{
				xconst = x;
				uu = y;
				vv = z;
			}
			trianglein.pointlist[ipoin * 2] = uu;
			trianglein.pointlist[ipoin * 2 + 1] = vv;
		}

		for (int i = 0; i < nseg; i++){
			inf2 >> ip1 >> ip2;
			trianglein.segmentlist[i * 2] = ip1-1;//start from 0
			trianglein.segmentlist[i * 2 + 1] = ip2-1;
		}
		triangleout.pointlist = (REAL *)NULL;      
		triangleout.pointattributelist = (REAL *)NULL;
		triangleout.pointmarkerlist = (int *)NULL; 
		triangleout.trianglelist = (int *)NULL; 
		triangleout.triangleattributelist = (REAL *)NULL;
		triangleout.neighborlist = (int *)NULL;        
		triangleout.segmentlist = (int *)NULL;
		triangleout.segmentmarkerlist = (int *)NULL;
		triangleout.edgelist = (int *)NULL;            
		triangleout.edgemarkerlist = (int *)NULL;  
		triangulate(tc, &trianglein, &triangleout, &trianglevor);
		if (ips == 0){
			int i, j;
			std::ofstream meshout;
			meshout.open("Examples/apaper_mesh/coons/one.vtk");
			meshout << "# vtk DataFile Version 2.0" << std::endl;
			meshout << "Unstructured Grid" << std::endl;
			meshout << "ASCII" << std::endl;
			meshout << "DATASET UNSTRUCTURED_GRID" << std::endl;
			meshout << "POINTS " << triangleout.numberofpoints << " double" << std::endl;
			for (i = 0; i < triangleout.numberofpoints; i++){
				meshout << triangleout.pointlist[i * 2] << " " << triangleout.pointlist[i * 2 + 1] << " " << 0 << std::endl;
			};
			meshout << std::endl;

			meshout << "CELLS " << triangleout.numberoftriangles << " " << triangleout.numberoftriangles * 4 << std::endl;
			for (i = 0; i < triangleout.numberoftriangles; i++){
				meshout << 3 << " " << triangleout.trianglelist[i * 3] << " " << triangleout.trianglelist[i * 3 + 1] << " " << triangleout.trianglelist[i * 3 + 2] << std::endl;
			}
			meshout << std::endl;
			meshout << "CELL_TYPES " << triangleout.numberoftriangles << std::endl;
			for (i = 0; i < triangleout.numberoftriangles; i++){
				meshout << 5 << std::endl; //for triangle
			}
		}
		int nnn = triangleout.numberofpoints;
		for (int i = 0; i < triangleout.numberofpoints; i++){
			uu = triangleout.pointlist[i * 2];
			vv = triangleout.pointlist[i * 2 + 1];
			if (ips <= 1){//front or back so remove y
				x=uu;
				y=yconst;
				z=vv;
			}
			else{
				x = xconst;
				y=uu;
				z=vv;
			}
			xvec2.push_back(x); yvec2.push_back(y); zvec2.push_back(z);
		}
		for (int i = 0; i < triangleout.numberoftriangles; i++){
			trian.push_back(triangleout.trianglelist[i * 3] + nnode2);
			trian.push_back(triangleout.trianglelist[i * 3 + 1] + nnode2);
			trian.push_back(triangleout.trianglelist[i * 3 + 2] + nnode2);
			trianmark.push_back(ips + 1);
		}
		nnode2 = nnode2 + triangleout.numberofpoints;
	}
	int i, j;
	std::ofstream meshout;
	meshout.open("Examples/apaper_mesh/coons/surfacemesh.vtk");
	meshout << "# vtk DataFile Version 2.0" << std::endl;
	meshout << "Unstructured Grid" << std::endl;
	meshout << "ASCII" << std::endl;
	meshout << "DATASET UNSTRUCTURED_GRID" << std::endl;
	meshout << "POINTS " << nnode +nnode2<< " double" << std::endl;
	for (i = 0; i < nnode; i++){
		meshout << xvec[i] << " " << yvec[i] << " " << zvec[i] << std::endl;
	};
	for (i = 0; i < nnode2; i++){
		meshout << xvec2[i] << " " << yvec2[i] << " " << zvec2[i] << std::endl;
	};
	meshout << std::endl;

	meshout << "CELLS " << quad.size()/4+trian.size()/3 << " " << quad.size()/4*5+trian.size()/3*4 << std::endl;
	for (i = 0; i < quad.size()/4; i++){
		meshout << 4 << " " << quad[i * 4] << " " << quad[i * 4 + 1] << " " << quad[i * 4 + 2] <<" "<< quad[i * 4 + 3]<< std::endl;
	}
	for (i = 0; i < trian.size() / 3; i++){
		meshout << 3 << " " << trian[i * 3]+nnode << " " << trian[i * 3+1] +nnode<< " " << trian[i * 3+2] +nnode<< std::endl;
	}
	meshout << std::endl;
	meshout << "CELL_TYPES " << quad.size() / 4 + trian.size() / 3 << std::endl;
	for (i = 0; i < quad.size() / 4; i++){
		meshout << 9 << std::endl; 
	}
	for (i = 0; i < trian.size() / 3; i++){
		meshout << 5 << std::endl;
	}
		


	//pass to tetgen
	tetgenio in, out;
	tetgenio::facet *ff;
	tetgenio::polygon *p;
	in.firstnumber = 0;
	in.numberofpoints = nnode+nnode2;
	in.pointlist = new REAL[in.numberofpoints * 3];
	for (int i = 0; i < nnode; i++){ 
		in.pointlist[i * 3] = xvec[i];
		in.pointlist[i * 3 + 1] = yvec[i];
		in.pointlist[i * 3 + 2] = zvec[i];
	}
	for (int i = 0; i < nnode2; i++){ 
		in.pointlist[i * 3+nnode*3] = xvec2[i];
		in.pointlist[i * 3 + 1+nnode*3] = yvec2[i];
		in.pointlist[i * 3 + 2+nnode*3] = zvec2[i];
	}
	in.numberoffacets = quad.size()/4+trian.size()/3;
	in.facetlist = new tetgenio::facet[in.numberoffacets];
	in.facetmarkerlist = new int[in.numberoffacets];
	for (int i = 0; i < quad.size()/4; i++){ 
		ff = &in.facetlist[i];
		ff->numberofpolygons = 1;
		ff->polygonlist = new tetgenio::polygon[ff->numberofpolygons];
		ff->numberofholes = 0;
		ff->holelist = NULL;
		p = &ff->polygonlist[0];
		p->numberofvertices = 4;
		p->vertexlist = new int[p->numberofvertices];
		for (int j = 0; j < p->numberofvertices; j++){
			p->vertexlist[j] = quad[i*4+j];
		}
		in.facetmarkerlist[i] = quadmark[i];
	}
	
	for (int i = 0; i < trian.size()/3; i++){ 
		ff = &in.facetlist[i + quad.size() / 4];
		in.facetmarkerlist[i + quad.size() / 4] = trianmark[i];
		ff->numberofpolygons = 1;
		ff->polygonlist = new tetgenio::polygon[ff->numberofpolygons];
		ff->numberofholes = 0;
		ff->holelist = NULL;
		p = &ff->polygonlist[0];
		p->numberofvertices = 3;
		p->vertexlist = new int[p->numberofvertices];
		for (int j = 0; j < p->numberofvertices; j++){
			p->vertexlist[j] = trian[i * 3 + j]+nnode;
		}
	}

	in.numberofregions = 4;
	in.regionlist = new REAL[in.numberofregions * 5];
	i = 0;
	in.regionlist[i * 5] = 100;
	in.regionlist[i * 5 + 1] = 100;
	in.regionlist[i * 5 + 2] = 100;
	in.regionlist[i * 5 + 3] = i;
	in.regionlist[i * 5 + 4] = -1.0;
	i = 1;
	in.regionlist[i * 5] = 100;
	in.regionlist[i * 5 + 1] = 100;
	in.regionlist[i * 5 + 2] = 400;
	in.regionlist[i * 5 + 3] = i;
	in.regionlist[i * 5 + 4] = -1.0;
	i = 2;
	in.regionlist[i * 5] = 950;
	in.regionlist[i * 5 + 1] = 100;
	in.regionlist[i * 5 + 2] = 150;
	in.regionlist[i * 5 + 3] = i;
	in.regionlist[i * 5 + 4] = -1.0;
	i = 3;
	in.regionlist[i * 5] = 950;
	in.regionlist[i * 5 + 1] = 100;
	in.regionlist[i * 5 + 2] = 250;
	in.regionlist[i * 5 + 3] = i;
	in.regionlist[i * 5 + 4] = -1.0;


	char tetc[20];
	strcpy(tetc, "pq1.5/10AnnV");
	tetrahedralize(tetc, &in, &out); //call TetGen

	//output to VTK
	std::ofstream tetout;
	tetout.open("Examples/apaper_mesh/coons/volumemesh.vtk");
		
	tetout << "# vtk DataFile Version 2.0" << std::endl;
	tetout << "Unstructured Grid" << std::endl;
	tetout << "ASCII" << std::endl;
	tetout << "DATASET UNSTRUCTURED_GRID" << std::endl;
	tetout << "POINTS " << out.numberofpoints << " double" << std::endl;
	for (i = 0; i < out.numberofpoints; i++){
		tetout << out.pointlist[i * 3] << " " << out.pointlist[i * 3 + 1] << " " << out.pointlist[i * 3+2] << std::endl;
	};
	tetout << std::endl;
	tetout << "CELLS " << out.numberoftetrahedra << " " << out.numberoftetrahedra * 5 << std::endl;
	for (i = 0; i < out.numberoftetrahedra; i++){
		tetout << 4 << " " << out.tetrahedronlist[i * 4] << " " << out.tetrahedronlist[i * 4 + 1] << " " << out.tetrahedronlist[i * 4 + 2] << " " << out.tetrahedronlist[i * 4+3] << std::endl;
	}
	tetout << std::endl;
	tetout << "CELL_TYPES " << out.numberoftetrahedra << std::endl;
	for (i = 0; i < out.numberoftetrahedra; i++){
		tetout << 10 << std::endl; //for tetrahedron
	}
	

	



	return 0;

}

