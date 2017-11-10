with Filter_Value;

package body HashMaps is

	procedure Put(M : in out HashMap; K : in Key; V : in Value) is
		H : Positive := Hash(K);
	begin
		if not ContainsKey(M, K) then
			if (H in M.contents'Range) then
				M.contents(H) := V;
			end if;
		end if;
	end Put;
	
	function Size(M : in HashMap) return natural is
		S : Natural := 0;
	begin
		for I in M.contents'Range loop
			if M.contents(I) /= NoValue then
				S := S + 1;
			end if;
		end loop;
		return S;
	end;
	
	function ContainsKey(M: in HashMap; K : in Key) return boolean is
		H : Positive := Hash(K);
	begin
		return H in M.contents'Range and then M.contents(H) /= NoValue;
	end;
	
	function Values(M : in HashMap) return Hash_Array is
		function IsRealValue(V : Value) return boolean is
		begin
			return V /= NoValue;
		end IsRealValue;
	
		procedure selector is new Filter_Value(Item => Value, Index => Positive, Item_Array => Hash_Array, Condition => IsRealValue);
		
		rtn : Hash_Array(M.contents'Range) := (M.contents'Range => NoValue);
	begin
		selector(M.contents, rtn);
		return rtn;
	end;
	
	
	procedure For_Each(M : in out HashMap) is
	begin
		for I in M.contents'Range loop
			if M.contents(I) /= NoValue then
				Action(M.contents(I));
			end if;
		end loop;
	end For_Each;
	
	procedure Remove(M : in out HashMap; K : in Key) is
		H : Positive := Hash(K);
	begin
		if H in M.contents'Range then
			M.contents(H) := NoValue;
		end if;
	end;

end HashMaps;