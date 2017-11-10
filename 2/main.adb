with filter_value;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   type index is new Integer;
   type item is new integer;
   type intarray is Array(index range <>) of item;
	
   function isPos(i : item) return boolean is
   begin
      return i > 0;
   end isPos;

   procedure filter is new Filter_Value(item, index, intarray, isPos);
	
   arr1 : intarray(1..5) := (-2, 3, -5, 1, 3);
   arr2 : intarray(1..5);
begin   
   for I in arr2'Range loop
      arr2(i) := 0;
   end loop;
   
   filter(arr1, arr2);
   
   for I in arr2'Range loop
      Put_Line(Item'Image(arr2(I)));
   end loop;
end Main;
