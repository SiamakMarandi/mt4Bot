//+------------------------------------------------------------------+
//|                                              ENtryConditions.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property strict

#include <..\Initializer.mqh>
#include <..\billWilliams.mqh>
#include <..\Ichimoku.mqh>
#include <..\Candles.mqh>
#include <..\Pivot.mqh>
#include <..\Order.mqh>

Pivot pivot;
Order order;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class EntryConditions : public Initializer
  {
private:

   double            maFastDiffOld;
   double            maSlowDiffOld;

public:
                     EntryConditions();
   bool              movingAverageBuyOrder();
   bool              movingAverageSellOrder();
   bool              UptrendDirection();
   bool              alligatorOpensMouthEnteryOrder();
   bool              DowntrendDirection();
   bool              diffSize();
   bool              parabolicSarBuyEntry();
   bool              parabolicSarSellEntry();
   bool              adxIndicatorBuyEntry();
   bool              adxIndicatorSellEntry();
   void              enterCondition();
                    ~EntryConditions();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
EntryConditions::EntryConditions()
  {
   maFastDiffOld = 0.0;
   maSlowDiffOld = 0.0;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
EntryConditions::~EntryConditions()
  {
  }
//+------------------------------------------------------------------+
bool EntryConditions::movingAverageBuyOrder()
  {

   if(maSlow < maMedium && maMedium < maFast && maFast < iLow(NULL,0,0))

     {



      return true;

     }

   else

      return false;

  }

//+-----------------------------movingAverageBuyOrder() End-------------------------------------+

//+-----------------------------movingAverageSellOrder() -------------------------------------+

bool EntryConditions::movingAverageSellOrder()

  {

   if(maFast < maMedium && maMedium < maSlow && maSlow > iHigh(NULL,0,0))

     {

      return true;

     }

   else

      return false;

  }

//+-----------------------------movingAverageSellOrder() End-------------------------------------+

//+-----------------------------trendDirection()-------------------------------------+
bool EntryConditions::UptrendDirection()
  {

   if(Close[3] > Open[3] && Close[2] > Open[2] && Close[1] > Open[1] && Close[1] > maFast)
     {

      return true;

     }

   else

      return false;


  }

//+----------------------------------trendDirection() End--------------------------------+


//+---------------------------------------alligatorOpensMouthEnteryOrder()---------------------------+
bool EntryConditions::alligatorOpensMouthEnteryOrder()
  {

   double maFastDiffNew = NormalizeDouble(MathAbs(maFast - maMedium),Digits);

   double maSlowDiffNew = NormalizeDouble(MathAbs(maSlow - maMedium), Digits);

   if(maFastDiffOld <= maFastDiffNew || maSlowDiffOld <= maSlowDiffNew)
     {

      maFastDiffOld = NormalizeDouble(maFastDiffNew, Digits);

      maSlowDiffOld = NormalizeDouble(maSlowDiffNew, Digits);

      return true;

     }

   else
     {

      return false;

     }

  }
//+----------------------------------------------alligatorOpensMouthEnteryOrder() End---------------------------------+


//+------------------------------------------------------------------+
bool EntryConditions::DowntrendDirection()
  {

   if((Close[3] < Open[3] && Close[2] < Open[2] && Close[1] < Open[1]) && Close[1] < maFast)

     {

      return true;

     }

   return false;

  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool EntryConditions::diffSize()
  {

   double maFastDiffNew = NormalizeDouble(MathAbs(maFast - maMedium),Digits);

   double maSlowDiffNew = NormalizeDouble(MathAbs(maSlow - maMedium), Digits);

   if(maFastDiffNew > 0.3 &&  maSlowDiffNew > 0.3)

     {

      return true;

     }


   else
     {

      return false;

     }

  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool EntryConditions::parabolicSarBuyEntry()
  {

   if(pSar < High[1])  // 0.2
      return true;

   else
      return false;

  };
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool EntryConditions::parabolicSarSellEntry()
  {

   if(pSar > High[1])  // 0.2
      return true;

   else
      return false;

  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool EntryConditions::adxIndicatorBuyEntry()
  {

   if(adx > adxMaxValue && adxPlusDI > adxMinusDI && adx > adxPlusDI)
     {

      return true;
     }
   else
     {
      return false;
     }

  };
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool EntryConditions::adxIndicatorSellEntry()
  {

   if(adx > adxMaxValue && adxPlusDI > adxMinusDI && adx > adxPlusDI)
     {

      return true;

     }

   else

     {

      return false;

     }

  };
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
void EntryConditions::enterCondition()
  {

   NormalizeDouble(MathAbs(maFast - maMedium),Digits);

   double macdScore = macd * -1 * 0.12;

   macdScore = NormalizeDouble(macdScore, Digits);

   double mfiScore = ((100 - mfi) / 100) * 0.12;

   mfiScore = NormalizeDouble(mfiScore, Digits);

   double result = macdScore + mfiScore;

   result = NormalizeDouble(result, Digits);

   Print(" macdScore : ", macdScore, "mfiScore : ", mfiScore, "result: ", result);

  };
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
