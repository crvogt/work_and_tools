#include <QCoreApplication>
#include <iostream>
#include <string>
#include <cmath>
#include <vector>
#include <numeric>
#include <functions.h>
#include <sys/time.h>
#include <ctime>
#include <QDebug>
//#include <windows.h>
#include <fstream>

using namespace std;
clock_t startTime = clock();
Vector3 obj1;
float d=0.2;//camera parameter (distance between postion of the camera and sensor)

int wr=256;//Total pixels
int hr=256;
float h=0.4;//dimension of the image plane
float w=0.4;


static const float np [3] = { 1, 0, 0 };
Vector3 vectnp(1,0,0);

static const float o [3] = {0,0,0 };//origin
Vector3 vecto(o[0],o[1],o[2]);

static const float c [3] = {0.5,0.8,0.2 };//postion of the camera
Vector3 vectc(c[0],c[1],c[2]);

static const float p1 [3] = {3 ,-2, 1 };//arbitrary point in St
Vector3 vectp1(p1[0],p1[1],p1[2]);

static const float p2 [3] = {4 ,-2, 1 } ;//uv planes
Vector3 vectp2(p2[0],p2[1],p2[2]);

static const float p3 [3] = {3 ,4,0} ;//other point in St
Vector3 vectp3(p3[0],p3[1],p3[2]);

static const float p4[3] = {4 ,4,0};//other point in uv planes
Vector3 vectp4(p4[0],p4[1],p4[2]);

static const float o1[3] = {3,1,0};//origin of the first plane
Vector3 vecto1(o1[0],o1[1],o1[2]);

Vector3 oc(c[0],c[1],c[2]);
Vector3 ocnorm = oc.Normalize();//any vector starting from center

static const float gtemp [3] = {1,1,1};//gaze vector
Vector3 g(gtemp[0],gtemp[1],gtemp[2]);
Vector3 gnorm=g.Normalize();


Vector3 up=obj1.crossproduct(ocnorm,gnorm);
Vector3 upnorm=up.Normalize();


Vector3 p1p2=obj1.substract(vectp1,vectp2);


float d3=obj1.scalarmul(vectnp,obj1.dot(p1p2,vectnp)/(vectnp.Length()*vectnp.Length())).Length();//distance between two planes

Vector3 vecto2=obj1.addition(vecto1,obj1.scalarmul(vectnp.Normalize(),d3));//origin at the second plane
//vector<float> stuv;

//depending on the number pixels this should be changed
int rowCount=(int)wr*hr;
float** stuvarr = new float*[rowCount];
int colCount=4;
//float stuvarr[65536][4];
int l=0;
int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    try{
        for(int i = 0; i < rowCount; ++i)
        {
            stuvarr[i] = new float[colCount];
        }

        for (int i=1;i<=wr;i++)
        {
            //            qDebug() << "one:" << endl;
            //            Sleep(500);
            for (int j=1;j<=hr;j++)
            {
                //                qDebug() << "two:" << endl;
                //                Sleep(500);
                //                              int i=wr;
                //                             int j=hr;
                Vector3 Q1=obj1.intersection1( i, j,gnorm,upnorm,d,wr,hr,h,w,vectc,vectp1,vectnp);
                Vector3 Q2=obj1.intersection2( i, j,gnorm,upnorm,d,wr,hr,h,w,vectc,vectp2,vectnp);
                ij2stuv result=calstuv(Q1,Q2,vectnp,vectp3,vectp4, vecto1,vecto2);
                for(int k=0;k<4;k++)
                {
                    qDebug() << "three:" << endl;
                    //Sleep(500);
                    if(k==0)
                    {
                        stuvarr[l][k]=result.s;
                    }
                    if(k==1)
                    {
                        stuvarr[l][k]=result.t;
                    }
                    if(k==2)
                    {
                        stuvarr[l][k]=result.u;
                    }
                    if(k==3)
                    {
                        stuvarr[l][k]=result.v;
                    }
                }
                l++;
            }

        }


    }

    catch (std::bad_alloc& ba)
    {
        std::cerr << "bad_alloc caught: " << ba.what() << '\n';
    }

    //saving the stuv matrix to a file
    ofstream myfile ("example.txt");
    if (myfile.is_open())
    {
        for (int i=0;i<wr*hr;i++)
        {
            for (int j=0;j<4;j++)
            {
                myfile << stuvarr[i][j] << " " ;
            }
            myfile <<endl;

        }
        myfile.close();
    }
    else cout << "Unable to open file";

    cout << double( clock() - startTime ) / (double)CLOCKS_PER_SEC<< " seconds." << endl;
    system("pause");

    for(int i = 0; i < rowCount; ++i) {
        delete [] stuvarr[i];
    }
    delete [] stuvarr;

    return a.exec();
}

