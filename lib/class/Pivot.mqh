//+------------------------------------------------------------------+
//|                                                        Pivot.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property strict
class Pivot
  {
private:

   double            high;
   double            low;
   double            close;
   double            pivotPoint;
   double            result;

public:
                     Pivot();
   void              initPivot(int period, int shift);
   double            pivotPoints_R1(int period,int shift);
   double            pivotPoints_S1(int period,int shift);
   double            pivotPoints_R2(int period,int shift);
   double            pivotPoints_S2(int period,int shift);
   double            pivotPoints_R3(int period,int shift);
   double            pivotPoints_S3(int period,int shift);
                    ~Pivot();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Pivot::Pivot()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Pivot::~Pivot()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Pivot::initPivot(int period, int shift)
  {
   high=iHigh(Symbol(),period,shift);
   low=iLow(Symbol(),period,shift);
   close=iClose(Symbol(),period,shift);
   pivotPoint = NormalizeDouble((high+low+close)/3,Digits);   

  }
//+------------------------------------------------------------------+
//|                         R1                                         |
//+------------------------------------------------------------------+
double Pivot::pivotPoints_R1(int period,int shift)
  {

   initPivot(period, shift);
   result = NormalizeDouble((2*pivotPoint)-low,Digits);
   return result;

  }
//+------------------------------------------------------------------+
//|                           S1                                       |
//+------------------------------------------------------------------+
double Pivot::pivotPoints_S1(int period,int shift)
  {

   initPivot(period, shift);
   result = NormalizeDouble((2*pivotPoint)-high,Digits);
   return result;

  }
//+------------------------------------------------------------------+
//|                            R2                                      |
//+------------------------------------------------------------------+
double Pivot::pivotPoints_R2(int period,int shift)
  {

   initPivot(period, shift);
   result = NormalizeDouble(pivotPoint+high-low,Digits);
   return result;

  }
//+------------------------------------------------------------------+
//|                              S2                                    |
//+------------------------------------------------------------------+
double Pivot::pivotPoints_S2(int period,int shift)
  {

   initPivot(period, shift);
   result = NormalizeDouble(pivotPoint-high-low,Digits);
   return result;

  }
//+------------------------------------------------------------------+
//|                              R3                                    |
//+------------------------------------------------------------------+
double Pivot::pivotPoints_R3(int period,int shift)
  {

   initPivot(period, shift);
   result = NormalizeDouble(pivotPoint + (2 * (high-low)),Digits);
   return result;

  }
//+------------------------------------------------------------------+
//|                              S3                                    |
//+------------------------------------------------------------------+
double Pivot::pivotPoints_S3(int period,int shift)
  {

   initPivot(period, shift);
   result = NormalizeDouble(pivotPoint - (2 * (high-low)),Digits);
   return result;

  }





//+------------------------------------------------------------------+
