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

	mp : intmap.HashMap(10);
begin

	for I in 1..5 loop
		mp.Put(key(I), value(I));
	end loop;
	
	Put_Line(Natural'Image(mp.Size));

end;