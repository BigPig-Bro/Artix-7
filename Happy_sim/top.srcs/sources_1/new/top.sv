module top (
	input clk,    // Clock
	
	output reg [15:0] data
	
);

//��N����
logic[1023:0] char[6:0] ;
assign char[0] = {256'h0001_0006_7ff8_4100_4900_4978_4948_7F48_4978_4902_4101_7FFE_0000_0000_0000_0000, 
			   	256'h0100_0100_0100_0100_0100_0100_0100_0100_0100_0100_0100_0100_0100_0100_0100_0000,
			   	256'h0080_0700_0000_ffff_0800_0481_1082_108c_10b0_ffc0_10b0_108c_1f82_0081_0081_0000,
			   	256'h0000_0004_0708_3910_2160_2102_2101_2ffe_4100_4100_c140_4120_0110_010c_0000_0000};

assign char[1] = {256'h0400_2410_2412_2421_7ffe_c440_4482_0402_0404_ffc8_0430_4428_3444_0582_041f_0000, 
			      256'h0081_0082_0084_feb8_9284_9282_9281_92ff_9291_9291_9291_fe91_0091_0081_0081_0000,
			      256'h0080_0100_0600_2fff_e000_0021_3e49_2292_776a_aa24_2a24_372a_22b2_3e41_0021_0000,
			      256'h0200_0202_4204_33f8_0004_41fa_5d52_5552_5552_55f2_5552_5552_5d52_41fa_0200_0000};



//������
logic [2:0][5:0]  index = 56'd0;

always@(posedge clk)begin 
	index[0] <= index[0] + 1;
	index[1] <= index[0] == 63? index[1] + 1 : index[1];
end

//����
logic [2:0][15:0] char_r; //ÿ��ʱ�̵�char
always@(posedge clk)begin
	char_r[ 0] 	<= char[0][1023 - index[ 0]*16 -:16];
	char_r[ 1] 	<= char[1][1023 - index[ 1]*16 -:16];
end

//��ֵ Ϊ���淽�㣬�˴�ֻ��������
always@(posedge clk)begin
	data[ 0] 	<= (char_r[1][ 0])?char_r[0][ 0]:1'b0;
	data[ 1] 	<= (char_r[1][ 1])?char_r[0][ 1]:1'b0;
	data[ 2] 	<= (char_r[1][ 2])?char_r[0][ 2]:1'b0;
	data[ 3] 	<= (char_r[1][ 3])?char_r[0][ 3]:1'b0;
	data[ 4] 	<= (char_r[1][ 4])?char_r[0][ 4]:1'b0;
	data[ 5] 	<= (char_r[1][ 5])?char_r[0][ 5]:1'b0;
	data[ 6] 	<= (char_r[1][ 6])?char_r[0][ 6]:1'b0;
	data[ 7] 	<= (char_r[1][ 7])?char_r[0][ 7]:1'b0;
	data[ 8] 	<= (char_r[1][ 8])?char_r[0][ 8]:1'b0;
	data[ 9] 	<= (char_r[1][ 9])?char_r[0][ 9]:1'b0;
	data[10] 	<= (char_r[1][10])?char_r[0][10]:1'b0;
	data[11] 	<= (char_r[1][11])?char_r[0][11]:1'b0;
	data[12] 	<= (char_r[1][12])?char_r[0][12]:1'b0;
	data[13] 	<= (char_r[1][13])?char_r[0][13]:1'b0;
	data[14] 	<= (char_r[1][14])?char_r[0][14]:1'b0;
	data[15] 	<= (char_r[1][15])?char_r[0][15]:1'b0;
end

endmodule