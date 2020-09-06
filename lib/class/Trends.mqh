//+------------------------------------------------------------------+
//|                                                       Trends.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property strict

#define  UPPER 1
#define  LOWER 2

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Trends
  {
private:

public:
                     Trends();

   double            fractalValue(int fMode, int fShift);

   string            trendDirection(int fMode, int fShift);

                    ~Trends();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Trends::Trends()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Trends::~Trends()
  {
  }
//+------------------------------------------------------------------+
//|                       Fractal                                    |
//+------------------------------------------------------------------+
double Trends::fractalValue(int fMode,int fShift)
  {

   return iFractals(NULL,0, fMode, fShift);

  }
//+------------------------------------------------------------------+
//|                       Fractal                                    |
//+------------------------------------------------------------------+
string Trends::trendDirection(int fMode, int fShift)
  {

   if(fractalValue(UPPER, 0) > fractalValue(UPPER, 1) && fractalValue(LOWER, 0) > fractalValue(LOWER, 1))
     {

      return "UP";

     }

   else
      if(fractalValue(UPPER, 0) < fractalValue(UPPER, 1) && fractalValue(LOWER, 0) < fractalValue(LOWER, 1))
        {


         return "DOWN";
        }

      else
         if(fractalValue(UPPER, 0) == fractalValue(UPPER, 1) && fractalValue(LOWER, 0) == fractalValue(LOWER, 1))
           {


            return "SIDE";

           }

         else

            return "Do Nothing";
  }
//+------------------------------------------------------------------+
