-- Student: Paxton Proctor
-- Instructor: Dr.Passos
-- Class: CMPS 3023 Logic Design
-- Project 1
-- Purpose: design mini micro processor that requires to execute some instructions.

library ieee;
use ieee.std_logic_1164.all;

-------REGISTER-------
entity Register is
  port(
            clock           : in std_logic;                       --Clock to update register
            enable          : in std_logic;                       --Enable to update register
            inputs          : in std_logic_vector  (7 downto 0);  --load entity
            andinputs       : in std_logic_vector  (7 downto 0);  --holds and value
            andenable       : in std_logic;                       --andEnable to update register
            subinputs       : in std_logic_vector  (7 downto 0);  --holds sub value
            subenable       : in std_logic;                       --subEnable to update register
            orinputs        : in std_logic_vector  (7 downto 0);  --holds or value
            orenable        : in std_logic;                       --orEnable to update register
            addinputs       : in std_logic_vector  (7 downto 0);  --holds add value
            addenable       : in std_logic;                       --addEnable to update register
            movinputs       : in std_logic_vector  (7 downto 0);  --holds mov value
            movenable       : in std_logic;                       --movEnable to update register
            outputs         : out std_logic_vector (7 downto 0);  --output value to register
   );
end entity;
