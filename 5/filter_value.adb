procedure Filter_Value(inarr : in Item_Array; outarr : out Item_Array) is
	id : Index := outarr'First;
begin
	for I in inarr'Range loop
		if Condition(inarr(I)) then
			outarr(id) := inarr(I);
			id := Index'Succ(id);
		end if;
	end loop;
end Filter_Value;
