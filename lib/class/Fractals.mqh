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

public:
                     Fractals();
   void              findUpperFractal();
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
void Fractals::findUpperFractal()
  {

 int   i = 0;
   while(iFractals(NULL, 0, MODE_UPPER, i) == 0)
     {
     
      i = i + 1;
      
     }

   Print("i    :    ", i, "      Fractal : ", iFractals(NULL, 0, MODE_UPPER, i));


  }
//+------------------------------------------------------------------+
