generic
   type Item is private;
   type Index is (<>);
   type Item_Array is Array(Index range <>) of Item;
   with function Condition(itm : Item) return boolean;
procedure Filter_Value(inarr : in Item_Array; outarr : out Item_Array);
