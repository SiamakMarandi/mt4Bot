//+------------------------------------------------------------------+
//|                                              CamarillaPivots.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property strict
class CamarillaPivots
  {
private:

   double            close;

   double            high;

   double            low;

   double            result;

public:
                     CamarillaPivots();
   void              initCamarilla(int period, int shift);
   double            camarillaPivots_R1(int period,int shift);
   double            camarillaPivots_S1(int period,int shift);
   double            camarillaPivots_R2(int period,int shift);
   double            camarillaPivots_S2(int period,int shift);
   double            camarillaPivots_R3(int period,int shift);
   double            camarillaPivots_S3(int period,int shift);
   double            camarillaPivots_R4(int period,int shift);
   double            camarillaPivots_S4(int period,int shift);
   double            camarillaPivots_R5(int period,int shift);
   double            camarillaPivots_S5(int period,int shift);
   double            camarillaPivots_R6(int period,int shift);
   double            camarillaPivots_S6(int period,int shift);
   bool              camarillaPivotsBuyCondition(int period, int shift);
                    ~CamarillaPivots();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CamarillaPivots::CamarillaPivots()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CamarillaPivots::~CamarillaPivots()
  {
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                      initialization                              |
//+------------------------------------------------------------------+
void CamarillaPivots::initCamarilla(int period, int shift)
  {

   high = iHigh(Symbol(),period,shift + 1);
   low = iLow(Symbol(),period,shift + 1);
   close = iClose(Symbol(),period,shift + 1);

  }
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_R1(int period,int shift)
  {

   initCamarilla(period, shift);
   result = close + (high - low) * (1.1/12);
   return result;

  }
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_S1(int period,int shift)
  {

   initCamarilla(period, shift);
   result =  close - (high - low) * 1.1/12;
   return result;

  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_R2(int period,int shift)
  {

   initCamarilla(period, shift);
   result = close + (high - low) * (1.1/6);
   return result;

  }
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_S2(int period,int shift)
  {

   initCamarilla(period, shift);
   result =  close - (high - low) * 1.1/6;
   return result;

  }
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_R3(int period,int shift)
  {

   initCamarilla(period, shift);
   result = close + (high - low) * (1.1/4);
   return result;

  }
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_S3(int period,int shift)
  {

   initCamarilla(period, shift);
   result =  close - (high - low) * 1.1/4;
   return result;

  }
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_R4(int period,int shift)
  {

   initCamarilla(period, shift);
   result = close + (high - low) * (1.1/2);
   return result;

  }
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_S4(int period,int shift)
  {

   initCamarilla(period, shift);
   result =  close - (high - low) * 1.1/2;
   return result;

  }
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_R5(int period,int shift)
  {

   initCamarilla(period, shift);
   result = camarillaPivots_R4(period, shift)
            + (camarillaPivots_R4(period, shift) - camarillaPivots_R3(period, shift)) * 1.168;
   return result;

  }
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_S5(int period,int shift)
  {

   initCamarilla(period, shift);
   result =  camarillaPivots_S4(period, shift)
             - (camarillaPivots_S3(period, shift) - camarillaPivots_S4(period, shift)) * 1.168;
   return result;

  }
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_R6(int period,int shift)
  {

   initCamarilla(period, shift);
   result = (high / low) * close;
   return result;

  }
//+------------------------------------------------------------------+
double CamarillaPivots::camarillaPivots_S6(int period,int shift)
  {

   initCamarilla(period, shift);
   result =  close - (camarillaPivots_R6(period, shift) - close);
   return result;

  }
//+------------------------------------------------------------------+
