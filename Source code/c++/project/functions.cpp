#include <QCoreApplication>
#include <iostream>
#include <string>
#include <cmath>
#include <vector>
#include <numeric>
#include <functions.h>
using namespace std;
Vector3 obj;
////this function calculates the l2 norm of the given vector
//float l2_norm(vector<float> const& u)
//{
//    float accum = 0.;
//    for (int i = 0; i < u.size(); ++i) {
//        accum += u[i] * u[i];
//    }
//  return sqrt(accum);
//}

Vector3::Vector3(void)
{
}
Vector3::~Vector3(void)
{
}

Vector3::Vector3(float X, float Y, float Z){
    this->X = X;
    this->Y = Y;
    this->Z = Z;
}

// Returns the length(norm) of the vector
float Vector3::Length(){
    return sqrt(X * X + Y * Y + Z * Z);
}

// Normalizes the vector
Vector3 Vector3::Normalize(){
    Vector3 vector;
    float length = this->Length();

    if(length != 0){
        vector.X = X/length;
        vector.Y = Y/length;
        vector.Z = Z/length;
    }

    return vector;
}
//this function performs a cross product between two vectors
Vector3 Vector3::crossproduct(Vector3 v1,Vector3 v2)
{
    Vector3 cross_p;
    cross_p.X = (v1.Y*v2.Z) - (v1.Z*v2.Y);
    cross_p.Y= -((v1.X*v2.Z) - (v1.Z*v2.X));
    cross_p.Z= (v1.X*v2.Y) - (v1.Y*v2.X);
    // cout<<"crossproduct = "<<cross_p.X<<"i"<<cross_p.Y<<"j"<<cross_p.Z<<"k"<<endl;
    return cross_p;
}

//this fnction performs vector substraction
Vector3 Vector3::substract(Vector3 v1,Vector3 v2)
{
    Vector3 vects;
    vects.X = v1.X-v2.X;
    vects.Y= v1.Y-v2.Y;
    vects.Z= v1.Z-v2.Z;
    //cout<<"crossproduct = "<<vects.X<<"i"<<vects.Y<<"j"<<vects.Z<<"k"<<endl;
    return vects;
}

//this fnction performs vector addition
Vector3 Vector3::addition(Vector3 v1,Vector3 v2)
{
    Vector3 vects;
    vects.X = v1.X+v2.X;
    vects.Y= v1.Y+v2.Y;
    vects.Z= v1.Z+v2.Z;
    //cout<<"crossproduct = "<<vects.X<<"i"<<vects.Y<<"j"<<vects.Z<<"k"<<endl;
    return vects;

}

//this function performs vector dot product
float Vector3::dot(Vector3 v1,Vector3 v2)
{
    return v1.X*v2.X + v1.Y*v2.Y +v1.Z*v2.Z;

}
//this function performs multiplication of scalar with vector element wise
Vector3 Vector3::scalarmul(Vector3 v1,float const num)
{
    Vector3 vects;
    vects.X = v1.X*num;
    vects.Y= v1.Y*num;
    vects.Z= v1.Z*num;
    return vects;

}


Vector3 Vector3::intersection1(int px,int py,Vector3 gtemp, Vector3 up,float d,float wr, float hr,float h,float w, Vector3 c, Vector3 p1, Vector3 np)
{

    Vector3 ci=obj.addition(c,obj.scalarmul(gtemp.Normalize(),d));
    Vector3 v=obj.crossproduct(gtemp,up);
    Vector3 temp1=obj.scalarmul(obj.scalarmul(v.Normalize(),w),((px-wr/2)/wr));
    Vector3 temp2=obj.scalarmul(obj.scalarmul(up.Normalize(),h),((py-hr/2)/hr));
    Vector3 p=obj.addition(obj.addition(temp1,temp2),ci);//this is specific pixel coordinate

    Vector3 cp=(obj.substract(p,c)).Normalize();//taking the direction of the unit vector is uniformly in the direction of pq
    float l=((p1.X-c.X)*np.X+ (p1.Y-c.Y)*np.Y+ (p1.Z-c.Z)*np.Z)/(cp.X*np.X+cp.Y*np.Y + cp.Z*np.Z);
    //float l2=((p2.X-c.X)*np.X+ (p2.Y-c.Y)*np.Y+ (p2.Z-c.Z)*np.Z)/(cp.X*np.X+cp.Y*np.Y + cp.Z*np.Z);
    Vector3 Q1=obj.addition(c,obj.scalarmul(cp,l));
    //Vector3 Q2=obj.addition(c,obj.scalarmul(cp,l2));
    return Q1;
}
Vector3 Vector3::intersection2(int px,int py,Vector3 gtemp, Vector3 up,float d,float wr, float hr,float h,float w, Vector3 c, Vector3 p2, Vector3 np)
{
    //Vector3 obj;
    Vector3 ci=obj.addition(c,obj.scalarmul(gtemp.Normalize(),d));
    Vector3 v=obj.crossproduct(gtemp,up);
    Vector3 temp1=obj.scalarmul(obj.scalarmul(v.Normalize(),w),((px-wr/2)/wr));
    Vector3 temp2=obj.scalarmul(obj.scalarmul(up.Normalize(),h),((py-hr/2)/hr));
    Vector3 p=obj.addition(obj.addition(temp1,temp2),ci);//this is specific pixel coordinate

    Vector3 cp=(obj.substract(p,c)).Normalize();//taking the direction of the unit vector is uniformly in the direction of pq
    //float l=((p1.X-c.X)*np.X+ (p1.Y-c.Y)*np.Y+ (p1.Z-c.Z)*np.Z)/(cp.X*np.X+cp.Y*np.Y + cp.Z*np.Z);
    float l2=((p2.X-c.X)*np.X+ (p2.Y-c.Y)*np.Y+ (p2.Z-c.Z)*np.Z)/(cp.X*np.X+cp.Y*np.Y + cp.Z*np.Z);
    //Vector3 Q1=obj.addition(c,obj.scalarmul(cp,l));
    Vector3 Q2=obj.addition(c,obj.scalarmul(cp,l2));
    return Q2;
}



ij2stuv calstuv(Vector3 q1,Vector3 q2,Vector3 np,Vector3 p3,Vector3 p4, Vector3 o1,Vector3 o2)
{

    //formulating new coordinating system in the two planes
    Vector3 a1=(obj.substract(p3,o1)).Normalize();//a1 and a2 are arbitrary vectors pass through point o1(in the first plane) where a1 perpendicular to a2
    Vector3 a2=obj.crossproduct(a1,np);
    Vector3 a3=(obj.substract(p4,o2)).Normalize();//a3 and a4 in the second plane
    Vector3 a4=obj.crossproduct(a3,np);
    Vector3 o1q1=obj.substract(q1,o1);
    Vector3 o2q2=obj.substract(q2,o2);
    ij2stuv result;
    result.s=abs(obj.dot(o1q1,a1));//projection of o1q1 to a1 vector
    result.t=abs(obj.dot(o1q1,a2));
    result.u=abs(obj.dot(o2q2,a3));//projection of o2q2 to a3 vector
    result.v=abs(obj.dot(o2q2,a4));
    return result;

}

