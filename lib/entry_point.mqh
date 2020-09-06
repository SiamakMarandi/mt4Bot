//+------------------------------------------------------------------+
//|                                                  entry_point.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property strict

#include <..\class\Indicators.mqh>
#include <..\class\EntryConditions.mqh>

//+------------------------------------------------------------------+

//Indicators indicator;
//new EntryConditions;
EntryConditions entryConditions;
//+-----------------------------movingAverageBuyOrder() -------------------------------------+

//+-----------------------------------------------buyCommandOrder()-----------------------------------------+
bool buyCommandOrder()
  {

   if(
   
   
    entryConditions.movingAverageBuyOrder() 
// entryConditions.UptrendDirection() &&
 // entryConditions.alligatorOpensMouthEnteryOrder() &&
 //entryConditions.diffSize() 
     // entryConditions.parabolicSarBuyEntry()
    // entryConditions.adxIndicatorBuyEntry()

   )

     {
      printf("---------BuyCommandOrder()----------------------");
      //ObjectCreate(0,"Arrow Name",OBJ_ARROW_UP,0,0,0);
      //ObjectSetInteger(0,"Arrow Name", OBJPROP_COLOR, clrBlueViolet);
      //ObjectSetInteger(0, "Arrow Name", OBJPROP_STYLE, STYLE_SOLID);
      return true;

     }
   else
      return false;

  }

//+-----------------------------------------------buyCommandOrder() End----------------------------------------------+

//+----------------------------------------------sellCommandOrder() -----------------------------------------------+
bool sellCommandOrder()

  {



   if(
      entryConditions.movingAverageSellOrder() 
 //entryConditions.DowntrendDirection() &&
// entryConditions.alligatorOpensMouthEnteryOrder() &&
  //   entryConditions.adxIndicatorSellEntry() &&
// entryConditions.diffSize() 
    //  entryConditions.parabolicSarSellEntry()


   )

    return true;
  else
      return false;


  }

//+----------------------------------sellCommandOrder() End--------------------------------+
//+------------------------------------------------------------------+
