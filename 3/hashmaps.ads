generic
	type Key is private;
	type Value is private;
	type Hash_Array is array(Positive range <>) of Value;
	with function Hash(k : Key) return Positive;
	NoValue : Value;
package HashMaps is

	type HashMap (Capacity : Positive) is tagged private;
	
	procedure Put(M : in out HashMap; K : in Key; V : in Value);
	function Size(M : in HashMap) return natural;

private

	type HashMap (Capacity : Positive) is tagged
		record
			contents : Hash_Array(1..Capacity) := (1..Capacity => NoValue);
		end record;

end HashMaps;