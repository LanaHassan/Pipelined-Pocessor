library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity BranchUnit is

port ( 
       Flags: in std_logic_vector(3 downto 0);
       JZSig : in std_logic;
       JNSig : in std_logic;
       JCSig : in std_logic;
       JmpSig : in std_logic;
       CallSig : in std_logic;
       RETSig: in std_logic;
       DecsSig: out std_logic
       );
       
end entity BranchUnit;

architecture BranchUnit_function of BranchUnit is

begin

DecsSig <= (Flags(0) and JZSig) or (Flags(1) and JNSig) or (Flags(2) and JCSig) or CallSig or RETSig or jmpSig;

 
end architecture BranchUnit_function;
