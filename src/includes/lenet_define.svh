`ifndef LENET_DEFINE_SVH
`define LENET_DEFINE_SVH
`define EOF                             32'HFFFF_FFFF
`define CONV1_WEIGHT                    150 //6 * 25
`define CONV1_BIAS                      6
`define CONV3_WEIGHT                    432 //48 * 9
`define CONV3_BIAS                      8
`define CONV4_WEIGHT                    1152 //16 * 8 * 9
`define CONV4_BIAS                      16
`define DENSE7_WEIGHT                   32768	//128 * 256
`define DENSE7_BIAS                     256
`define DENSE8_WEIGHT                   2560	//256 * 10
`define DENSE8_BIAS                     10


`define FEATURE_QUANTITY                500
`define FEATURE_SIZE                    784	//28 * 28

`define SIZE_DATA                       (4) //float
`define SIZE_LABEL                       (1) //unsigned char
// Memory Address
`define ADDRESS_USER_START              32'H8000_0000
`define ADDRESS_CONV1_WEIGHT            (`ADDRESS_USER_START + 0)
`define ADDRESS_CONV1_BIAS              (`ADDRESS_CONV1_WEIGHT + `SIZE_DATA * `CONV1_WEIGHT)
`define ADDRESS_CONV3_WEIGHT            (`ADDRESS_CONV1_BIAS + `SIZE_DATA * `CONV1_BIAS)
`define ADDRESS_CONV3_BIAS              (`ADDRESS_CONV3_WEIGHT + `SIZE_DATA * `CONV3_WEIGHT)
`define ADDRESS_CONV4_WEIGHT            (`ADDRESS_CONV3_BIAS + `SIZE_DATA * `CONV3_BIAS)
`define ADDRESS_CONV4_BIAS              (`ADDRESS_CONV4_WEIGHT + `SIZE_DATA * `CONV4_WEIGHT)
`define ADDRESS_DENSE7_WEIGHT           (`ADDRESS_CONV4_BIAS + `SIZE_DATA * `CONV4_BIAS)
`define ADDRESS_DENSE7_BIAS             (`ADDRESS_DENSE7_WEIGHT + `SIZE_DATA * `DENSE7_WEIGHT)
`define ADDRESS_DENSE8_WEIGHT           (`ADDRESS_DENSE7_BIAS + `SIZE_DATA * `DENSE7_BIAS)
`define ADDRESS_DENSE8_BIAS             (`ADDRESS_DENSE8_WEIGHT + `SIZE_DATA * `DENSE8_WEIGHT)

`define ADDRESS_MNIST_FEATURE           (`ADDRESS_DENSE8_BIAS + `SIZE_DATA * `DENSE8_BIAS)
`define ADDRESS_MNIST_LABEL             (`ADDRESS_MNIST_FEATURE + `SIZE_DATA * `FEATURE_SIZE * `FEATURE_QUANTITY)

`endif // ~LENET_DEFINE_SVH
