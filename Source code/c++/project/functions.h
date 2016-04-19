#include <QCoreApplication>
#include <iostream>
#include <string>
#include <cmath>
#include <vector>
#include <numeric>
#include <math.h>
using namespace std;

#ifndef FUNCTIONS_H
#define FUNCTIONS_H

float l2_norm(vector<float> const& u);
class Vector3
{
public:
    Vector3(void);
    Vector3(float X, float Y, float Z);

    ~Vector3(void);
    float Length();

    Vector3 Normalize();
    Vector3 crossproduct(Vector3 v1,Vector3 v2);
    Vector3 substract(Vector3 v1,Vector3 v2);
    float dot(Vector3 v1,Vector3 v2);
    float X,Y,Z;
    Vector3 scalarmul(Vector3 v1,float const num);
    Vector3 addition(Vector3 v1,Vector3 v2);
    Vector3 intersection1(int px,int py,Vector3 gtemp, Vector3 up,float d,float wr, float hr,float h,float w, Vector3 c, Vector3 p1, Vector3 np);
    Vector3 intersection2(int px,int py,Vector3 gtemp, Vector3 up,float d,float wr, float hr,float h,float w, Vector3 c,  Vector3 p2, Vector3 np);

};
struct ij2stuv {
    float s;
    float t;
    float u;
    float v;
};
ij2stuv calstuv(Vector3 q1,Vector3 q2,Vector3 np,Vector3 p3,Vector3 p4, Vector3 o1,Vector3 o2);

#endif // FUNCTIONS_H
