//+------------------------------------------------------------------+
//|                                                        Order.mqh |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
class Order
  {
private:

public:

                     Order();
   void              orderTrailingStopLoss();
   void               buyOrder();
   void               sellOrder();
   void              closeOrder();

                    ~Order();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Order::Order()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Order::~Order()
  {
  }

//+------------------------------------------------------------------+
//|                       buy Order                                                    |
//+------------------------------------------------------------------+
void Order::buyOrder()

  {
//ticketNumber = OrderSend(Symbol(),OP_BUY,lot,Ask,5,0,takeProfit,"Yoda Group",MagicBuy,0,clrGreen);
   ticketNumber = OrderSend(Symbol(),OP_BUY,lot,Ask,5,0,0,"Yoda Group",MagicBuy,0,clrGreen);
   if(GetLastError() == 134)
     {

      ExpertRemove();

     }

   orderFlag = "BUY";



  }

//+------------------------------------------------------------------+
//|                sell order                                                  |
//+------------------------------------------------------------------+
void Order::sellOrder()
  {

//ticketNumber = OrderSend(Symbol(),OP_SELL,lot,Bid,5,0,takeProfit,"Yoda Group",MagicSell,0,clrRed);
   ticketNumber = OrderSend(Symbol(),OP_SELL,lot,Bid,5,0,0,"Yoda Group",MagicSell,0,clrRed);
   if(GetLastError() == 134)
     {

      ExpertRemove();

     }

   orderFlag = "SELL";

  }

//+------------------------------------------------------------------+
//|         close order                                                         |
//+------------------------------------------------------------------+
void Order::closeOrder()
  {

   order_type=OrderType();
   if(order_type == 0)
     {
      closePrice = Bid;

     }
   else
     {

      closePrice = Ask;
     }

// orderTickets = OrderTicket();
   orderClosed =  OrderClose(ticketNumber,lot,closePrice,5,clrAzure);

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Order::orderTrailingStopLoss()
  {
   double            trailingStop = 32;
   order_type=OrderType();
   if(order_type == 0)
     {
      // trailingStop = Open[1] * Point;

      //  bool ordermb=OrderModify(OrderTicket(),OrderOpenPrice(),trailingStop,OrderTakeProfit(),0,clrYellow);
      // bool ordermb=OrderModify(OrderTicket(),OrderOpenPrice(),Bid-trailingStop*Point,OrderTakeProfit(),0,clrYellow);
      bool ordermb=OrderModify(OrderTicket(),OrderOpenPrice(),Bid-trailingStop*Point,OrderTakeProfit(),0,clrYellow);
      printf("trailing triggered!!!!!!");

     }
   else
     {
      //   trailingStop = Close[1] * Point;
      //   bool orderms=OrderModify(OrderTicket(),OrderOpenPrice(),trailingStop,OrderTakeProfit(),0,clrYellow);
      //bool orderms=OrderModify(OrderTicket(),OrderOpenPrice(),Ask+trailingStop*Point,OrderTakeProfit(),0,clrYellow);
      bool orderms=OrderModify(OrderTicket(),OrderOpenPrice(),Ask+trailingStop*Point,OrderTakeProfit(),0,clrYellow);
      printf("trailing triggered!!!!!!");

     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
