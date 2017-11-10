with Ada.Text_IO; use Ada.Text_IO;
with HashMaps;

procedure Main is
	type key is new Integer;
	type value is new Integer;
	type intarray is array(Positive range <>) of value;
	
	function absolute(k : key) return positive is
	begin
		if k > 0 then
			return Positive(k);
		elsif k < 0 then
			return Positive((-1) * k);
		else
			return 1;
		end if;
	end absolute;
	
	package intmap is new HashMaps(key, value, intarray, absolute, -1);
	
	procedure WriteItem(V : in out value) is
	begin
		Put_Line(value'Image(V));
	end WriteItem;
	
	procedure WriteAll is new intmap.For_Each(Action => WriteItem);
	
	mp : intmap.HashMap(10);
begin

	for I in -5..5 loop
		mp.Put(key(I), value(I));
	end loop;
	
	WriteAll(mp);
	Put_Line("");
	
	mp.remove(2); -- Mivel abs(x) az index, ezert -2 key = 2 key
	mp.remove(3);
	
	WriteAll(mp);
	Put_Line("");
	
	mp.put(2, 2);
	mp.put(3, 3);
	
	WriteAll(mp);
	Put_Line("");
	
end;