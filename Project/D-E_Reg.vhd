library ieee;
use ieee.std_logic_1164.all;
entity DEx_Reg is 
Generic ( n : integer := 16);
port(
Clk : in std_logic;
Rst : in std_logic;
Enb : in std_logic;

InSignal_i: in std_logic;
OutSignal_i: in std_logic;
RetSignal_i: in std_logic;
PC_i: in std_logic_vector(15 downto 0);
ExSelect_i: in std_logic_vector(1 downto 0);
MemRead_i: in std_logic;
MemWrite_i: in std_logic;
WB_i: in std_logic;
Ra_i: in std_logic_vector(2 downto 0);
Rb_i: in std_logic_vector(2 downto 0);
Vra_i: in std_logic_vector(15 downto 0);
Vrb_i: in std_logic_vector(15 downto 0);
PopSignal_i: in std_logic;
PushSignal_i: in std_logic;
Immediate_i: in std_logic_vector(7 downto 0);
Flags_i: in std_logic_vector(3 downto 0);
Selectors_i: in std_logic_vector(3 downto 0);
CallSig_i: in std_logic;

JZSig_i : in std_logic;
JNSig_i : in std_logic;
JCSig_i : in std_logic;
JmpSig_i : in std_logic;
IntSig_i : in std_logic;

InSignal_o: out std_logic;
OutSignal_o: out std_logic;
RetSignal_o: out std_logic;
PC_o: out std_logic_vector(15 downto 0);
ExSelect_o: out std_logic_vector(1 downto 0);
MemRead_o: out std_logic;
MemWrite_o: out std_logic;
WB_o: out std_logic;
Ra_o: out std_logic_vector(2 downto 0);
Rb_o: out std_logic_vector(2 downto 0);
Vra_o: out std_logic_vector(15 downto 0);
Vrb_o: out std_logic_vector(15 downto 0);
PopSignal_o: out std_logic;
PushSignal_o: out std_logic;
Immediate_o: out std_logic_vector(7 downto 0);
Flags_o: out std_logic_vector(3 downto 0);
Selectors_o: out std_logic_vector(3 downto 0);
CallSig_o: out std_logic;

JZSig_o : out std_logic;
JNSig_o : out std_logic;
JCSig_o : out std_logic;
JmpSig_o : out std_logic;
IntSig_o : out std_logic;
RetiSig_i : in std_logic;
RetiSig_o : out std_logic
);
end entity DEx_Reg;

architecture DEx_Reg_arch of DEx_Reg is
component General_Reg is 
Generic ( n : integer := 16);
port(
Clk : in std_logic;
Rst : in std_logic;
Enb : in std_logic;
D : in std_logic_vector((n-1) downto 0);
Q : out std_logic_vector((n-1) downto 0)
);
end component;

component One_Bit_Reg is 
port(
Clk : in std_logic;
Rst : in std_logic;
Enb : in std_logic;
D : in std_logic;
Q : out std_logic
);
end component;

begin

InSignal: One_Bit_Reg port map(Clk,Rst,Enb,InSignal_i,InSignal_o);
OutSignal: One_Bit_Reg port map(Clk,Rst,Enb,OutSignal_i,OutSignal_o); 
RetSignal: One_Bit_Reg port map(Clk,Rst,Enb,RetSignal_i,RetSignal_o);
PC : General_Reg generic map (n=>16) port map(Clk,Rst,Enb,PC_i,PC_o);
ExSelect: General_Reg generic map (n=>2) port map(Clk,Rst,Enb,ExSelect_i,ExSelect_o);
MemRead: One_Bit_Reg port map(Clk,Rst,Enb,MemRead_i,MemRead_o);
MemWrite:  One_Bit_Reg port map(Clk,Rst,Enb,MemWrite_i,MemWrite_o);
WB: One_Bit_Reg port map(Clk,Rst,Enb,WB_i,WB_o);
Ra: General_Reg generic map (n=>3) port map(Clk,Rst,Enb,Ra_i,Ra_o);
Rb: General_Reg generic map (n=>3) port map(Clk,Rst,Enb,Rb_i,Rb_o);
Vra: General_Reg generic map (n=>16) port map(Clk,Rst,Enb,Vra_i,Vra_o);
Vrb: General_Reg generic map (n=>16) port map(Clk,Rst,Enb,Vrb_i,Vrb_o);
PopSignal: One_Bit_Reg port map(Clk,Rst,Enb,PopSignal_i,PopSignal_o);
PushSignal: One_Bit_Reg port map(Clk,Rst,Enb,PushSignal_i,PushSignal_o);
Immediate: General_Reg generic map (n=>8) port map(Clk,Rst,Enb,Immediate_i,Immediate_o); 
Flags: General_Reg generic map (n=>4) port map(Clk,'0',Enb,Flags_i,Flags_o);
Selectors: General_Reg generic map (n=>4) port map(Clk,Rst,Enb,Selectors_i,Selectors_o);
CallSig: One_Bit_Reg port map(Clk,Rst,Enb,CallSig_i,CallSig_o);

JZSig: One_Bit_Reg port map(Clk,Rst,Enb,JZSig_i,JZSig_o);
JNSig: One_Bit_Reg port map(Clk,Rst,Enb,JNSig_i,JNSig_o);
JCSig: One_Bit_Reg port map(Clk,Rst,Enb,JCSig_i,JCSig_o);
JmpSig: One_Bit_Reg port map(Clk,Rst,Enb,JmpSig_i,JmpSig_o);
IntSig: One_Bit_Reg port map(Clk,Rst,Enb,IntSig_i,IntSig_o);
RetiSig: One_Bit_Reg port map(Clk,Rst,Enb,RetiSig_i,RetiSig_o);


end DEx_Reg_arch; 
