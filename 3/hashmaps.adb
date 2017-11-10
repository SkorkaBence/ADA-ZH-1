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

end HashMaps;