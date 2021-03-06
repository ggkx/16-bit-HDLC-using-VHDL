----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:51:33 11/28/2013 
-- Design Name: 
-- Module Name:    zeroin - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity zeroin is
port(clk,reset,data:in std_logic;
   det:inout std_logic;
	y:out std_logic);
end zeroin;

architecture Behavioral of zeroin is
	type statetype is(s1,s2,s3,s4,s5,s6,s7);
	signal n_state:statetype;

	 
begin
	process(clk,reset,data)
	variable k: std_logic;
	begin
	
		if reset='1' then

			det<='0';
			y<=data;
		
		else
		   if clk'event and clk='1' then
			 
			   
		   	case n_state is
		
					 
				 when s1=>
				 det<='0';
				 if data='1' then 
				    y<=data;
					
					 n_state<=s2;
				 
				 else 
				y<=data;
				
				    n_state<=s1;

					end if;
					 
				 when s2=>
				 det<='0';
				 if data='1' then 
				
				    y<=data;
					n_state<=s3;
				
				 else 
			
				y<=data;
								
			n_state<=s1;

					end if;
					
					 when s3=>
					 det<='0';
				 if data='1' then 
				   
				   y<=data;
					
					 n_state<=s4;
			
					 
				 else 
			
				y<=data;
			
				    n_state<=s1;

				  end if;
				  
				 when s4=>
				 det<='0';
				 if data='1' then 
				  
				    y<=data;
					
					 n_state<=s5;
			
				 else 
				
				y<=data;
				
				    n_state<=s1;

					end if;
					
					 when s5=>
				 if data='1' then 
				   
                y<=data;
                det<='1';
					 n_state<=s6;
				 
			 else 
			
				y<=data;
		          det<='0';
				    n_state<=s1;

					end if;
					
					when s6=> 
				  
			 
				  if det='1' then
					 
					 y<='0';
					 k:=data;
			       n_state<=s7;
					 det<='0';
				  else
					 y<=data;
					 n_state<=s1;
				
					 end if;

			
				
				 when s7=>
						    y<=k;
							
	                
						 n_state<=s2;
					  

				
				end case; 
				
		end if;		 
	end if;			 
				 
end process;





end Behavioral;

