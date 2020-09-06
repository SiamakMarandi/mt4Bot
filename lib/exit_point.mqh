//+------------------------------------------------------------------+
//|                                                  entry_point.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property strict

#include <..\class\ExitConditions.mqh>
//#include <..\class\Indicators.mqh>

ExitConditions exitConditions;

//Indicators indicators;

//+------------------------------------------------------------------+


//+-----------------------------exitCommand()-------------------------------------+----------------------------------+
bool exitCommandOrder()
  {


   if(
   //(
   //exitConditions.alligatorCloseMouthExitOrder() ||
      exitConditions.rotatingAlligator()
      //|| exitConditions.adxIndicatorExit()
 //   || exitConditions.upCounterTrend()
 //   || exitConditions.downCounterTrend()
  //  || exitConditions.movingAverageInterfere() )  &&
    //  ||  exitConditions.parabolicSarExit()
      
      )

      return true;

   else

      return false;

  }


//+--------------------------exitCommand() End----------------------------------------+
//+------------------------------------------------------------------+
