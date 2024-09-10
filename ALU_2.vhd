LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY ALU_2 IS
	PORT (Clock: IN STD_LOGIC;
			A, B: IN UNSIGNED(7 DOWNTO 0);
			OP: IN UNSIGNED(0 TO 15);
			Neg: OUT STD_LOGIC;
			R1: OUT UNSIGNED(3 DOWNTO 0);
			R2: OUT UNSIGNED(3 DOWNTO 0));
END ALU_2;

ARCHITECTURE calculation OF ALU_2 IS
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
						Result <= Reg1(3 DOWNTO 0) & Reg1(7 DOWNTO 4);
					WHEN "0100000000000000" =>
						Result <= Reg1 OR Reg2;
					WHEN "0010000000000000" =>
						Result <= Reg2 - 5;
					WHEN "0001000000000000" =>
						Result <= NOT Reg1;
					WHEN "0000100000000000" =>
						Result <= Reg1(0) & Reg1(1) & Reg1(2) & Reg1(3) & Reg1(4) & Reg1(5) & Reg1(6) & Reg1(7); 
					WHEN "0000010000000000" =>
						IF (Reg1 > Reg2) THEN
							Result <= Reg1;
						ELSE 
							Result <= Reg2;
						END IF;
					WHEN "0000001000000000" =>
						IF (Reg2 > Reg1) THEN
							Neg <= '1';
							Result <= Reg1 + ((NOT Reg2) + 1);
						ELSE
							Neg <= '0';
							Result <= Reg1 - Reg2;
						END IF;
					WHEN "0000000100000000" =>
						Result <= Reg1 XNOR Reg2;
					WHEN "0000000010000000" =>
						Result <= Reg2(4 DOWNTO 0) & Reg2(7 DOWNTO 5);
					WHEN OTHERS =>
						Result <= "--------";
				END CASE;
			END IF;
		END PROCESS;
	R1 <= Result(7 DOWNTO 4);
	R2 <= Result(3 DOWNTO 0);
END calculation;
