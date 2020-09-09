//+------------------------------------------------------------------+
//|                                                     Fractals.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property strict
class Fractals
  {
private:

   double            m;

   int               XA, XB, X;

   double            YA, YB, Y;

public:
                     Fractals();

   void              mUpperFractal();

   void              mLowerFractal();

   double            ySellFractal(int X);

   double            yBuyFractal(int xCandle);

                    ~Fractals();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Fractals::Fractals()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Fractals::~Fractals()
  {
  }
//+------------------------------------------------------------------+
void Fractals::mUpperFractal()
  {


   int i = 0;

   int j = 0;

   while(iFractals(NULL, 0, MODE_UPPER, i) == 0)
     {

      i = i + 1;

     }

   YB =  iFractals(NULL, 0, MODE_UPPER, i);




//  Print("i    :    ", i, "      Fractal : ", iFractals(NULL, 0, MODE_UPPER, i));

   j = i + 1;

   while(iFractals(NULL, 0, MODE_UPPER, j) == 0)
     {

      j = j + 1;

     }

   candleFlag = j;

   YA =  iFractals(NULL, 0, MODE_UPPER, j);

   XA = 0;

   XB = j - i;

   Print("XA    :    ", XA, "      YA    : ", YA,
         "        XB    :    ", XB, "      YB : ", YB);

   m = (YA - YB) / (XA - XB);



  }
//+------------------------------------------------------------------+
void Fractals::mLowerFractal()
  {

   int i = 0;

   int j = 0;

   while(iFractals(NULL, 0, MODE_LOWER, i) == 0)
     {

      i = i + 1;

     }

   YB =  iFractals(NULL, 0, MODE_LOWER, i);

//  Print("i    :    ", i, "      Fractal : ", iFractals(NULL, 0, MODE_UPPER, i));

   j = i + 1;

   while(iFractals(NULL, 0, MODE_LOWER, j) == 0)
     {

      j = j + 1;

     }

   candleFlag = j;

   YA =  iFractals(NULL, 0, MODE_LOWER, j);

   XA = 0;

   XB = j - i;

   Print("XA    :    ", XA, "      YA    : ", YA,
         "        XB    :    ", XB, "      YB : ", YB);

   m = (YA - YB) / (XA - XB);



  }
//+------------------------------------------------------------------+
double Fractals::ySellFractal(int xCandle)
  {



   Y = (m * xCandle) + YA;

   return Y;

  }
//+------------------------------------------------------------------+
double Fractals::yBuyFractal(int xCandle)
  {


   Y = (m * xCandle) + YA;

   return Y;

  }
//+------------------------------------------------------------------+
