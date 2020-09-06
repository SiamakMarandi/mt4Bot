//+------------------------------------------------------------------+
//|                                               ExitConditions.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property strict


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class ExitConditions : public Initializer
  {
private:

   double            maFastDiffOld;
   double            maSlowDiffOld;

public:
                     ExitConditions();
   bool              alligatorCloseMouthExitOrder();
   bool              rotatingAlligator();
   bool              upCounterTrend();
   bool              downCounterTrend();
   bool              movingAverageInterfere();
   bool              parabolicSarExit();
   bool              adxIndicatorExit();
                    ~ExitConditions();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ExitConditions::ExitConditions()
  {


   maFastDiffOld = 0;
   maSlowDiffOld = 0;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ExitConditions::~ExitConditions()
  {
  }
//+------------------------------------------------------------------+
//+---------------------------------------alligatorCloseMouth---------------------------------------------------+
bool ExitConditions::alligatorCloseMouthExitOrder()
  {

   double maFastDiffNew = NormalizeDouble(MathAbs(maFast - maMedium),Digits);

   double maSlowDiffNew = NormalizeDouble(MathAbs(maSlow - maMedium), Digits);

   if(maFastDiffNew < maFastDiffOld && maSlowDiffNew < maSlowDiffOld && flagCounter >= maxFlagCounter)
     {

      maFastDiffOld = NormalizeDouble(maFastDiffNew, Digits);

      maSlowDiffOld = NormalizeDouble(maSlowDiffNew, Digits);

      //   printf(" -------------- alligatorCloseMouthExitOrder() ---------------------- ");

      flagCounter = 0;

      return true;

     }

   else
     {

      flagCounter++;;
      return false;

     }


  }

//+--------------------------alligatorCloseMouth() End----------------------------------------+

//+------------------------------------------------------rotatingAlligator()--------------------------------------+
bool ExitConditions::rotatingAlligator()
  {

   if(orderFlag == "BUY" && maSlow > maFast)
     {

      //  printf(" -------------- rotatingAlligator() BUY ---------------------- ");

      return true;


     }

   else
      //if(orderFlag == "SELL" && ma_fast > ma_slow)
      if(orderFlag == "SELL" && maSlow < maFast)

        {

         //  printf(" -------------- rotatingAlligator() SELL---------------------- ");

         return true;

        }

      else

         return false;

  }
//+---------------------------------------------------------------------------------------------------------+
bool ExitConditions::upCounterTrend(void)
  {

   if(Close[3] < Open[3] && Close[2] < Open[2] && Close[1] < Open[1] && orderFlag == "BUY")
     {

      return true;

     }

   else

      return false;


  }

//+------------------------------------------------------------------+

bool ExitConditions::downCounterTrend(void)

  {

   if(Close[3] > Open[3] && Close[2] > Open[2] && Close[1] > Open[1] && orderFlag == "SELL")

     {

      return true;

     }

   else
      return false;



  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
bool ExitConditions::adxIndicatorExit()
  {

   if((orderFlag == "BUY" && adxMinusDI >= adxPlusDI) || (orderFlag == "SELL" && adxMinusDI <= adxPlusDI))
     {

      return true;

     }
   else
     {

      return false;

     }



  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ExitConditions::movingAverageInterfere(void)
  {

   if(orderFlag == "BUY")
     {

      if(maFast <= maMedium || maMedium <= maSlow)
        {

         return true;
        }

      else

         return false;

     }

   else

     {
      if(maFast >= maMedium || maMedium >= maSlow)

        {

         return true;

        }

      else

         return false;

     }

  }

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool ExitConditions::parabolicSarExit()
  {
   if(orderFlag == "BUY")
     {
      if(parapolicSarIndicator(0.007,0.2,0) > Close[0])//0.1
         return true;

      else
         return false;
     }
   else
     {
      if(parapolicSarIndicator(0.007,0.2,0) < Close[0])//0.01

         return true;

      else
         return false;

     }

  };
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
