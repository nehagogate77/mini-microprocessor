LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY ALU_3 IS
	PORT (Clock: IN STD_LOGIC;
			A, B: IN UNSIGNED(7 DOWNTO 0);
			Student_id: IN UNSIGNED(3 DOWNTO 0);
			OP: IN UNSIGNED(0 TO 15);
			Neg: OUT STD_LOGIC;
			R1: OUT UNSIGNED(3 DOWNTO 0);
			R2: OUT UNSIGNED(3 DOWNTO 0));
END ALU_3;

ARCHITECTURE calculation OF ALU_3 IS
	SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0):=(OTHERS=>'0');
	SIGNAL Reg4: UNSIGNED(0 TO 7);
	BEGIN
		Reg1 <= A;
		Reg2 <= B;
		
		PROCESS(Clock, OP)
		BEGIN
			IF(rising_edge(Clock)) THEN
				CASE OP IS
					WHEN "1000000000000000" =>
						IF (Student_id mod(2) = 0) THEN
							Result <= "00000001";
						ELSE 
							Result <= "00000000";
						END IF;
					WHEN "0100000000000000" =>
						IF (Student_id mod(2) = 0) THEN
							Result <= "00000001";
						ELSE 
							Result <= "00000000";
						END IF;
					WHEN "0010000000000000" =>
						IF (Student_id mod(2) = 0) THEN
							Result <= "00000001";
						ELSE 
							Result <= "00000000";
						END IF;
					WHEN "0001000000000000" =>
						IF (Student_id mod(2) = 0) THEN
							Result <= "00000001";
						ELSE 
							Result <= "00000000";
						END IF;
					WHEN "0000100000000000" =>
						IF (Student_id mod(2) = 0) THEN
							Result <= "00000001";
						ELSE 
							Result <= "00000000";
						END IF;
					WHEN "0000010000000000" =>
						IF (Student_id mod(2) = 0) THEN
							Result <= "00000001";
						ELSE 
							Result <= "00000000";
						END IF;
					WHEN "0000001000000000" =>
						IF (Student_id mod(2) = 0) THEN
							Result <= "00000001";
						ELSE 
							Result <= "00000000";
						END IF;
					WHEN "0000000100000000" =>
						IF (Student_id mod(2) = 0) THEN
							Result <= "00000001";
						ELSE 
							Result <= "00000000";
						END IF;
					WHEN "0000000010000000" =>
						IF (Student_id mod(2) = 0) THEN
							Result <= "00000001";
						ELSE 
							Result <= "00000000";
						END IF;
					WHEN OTHERS =>
						Result <= "--------";
				END CASE;
			END IF;
		END PROCESS;
	R1 <= Result(7 DOWNTO 4);
	R2 <= Result(3 DOWNTO 0);
END calculation;
