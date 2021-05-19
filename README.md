1.  i2c 模块的dut是项目中使用的IP，核心模块经过类似于加密的处理后可读性很差，所以在建立寄存器模型时没有配置硬件路径，故只能进行前门访问。
2.  reference model 通常是用其他语言写的硬件模型，目前对于model 的学习不深，尚未添加相关模块。
3.  组件中包含apb总线的monitor和i2c SCL SDA总线monitor，可以检测总线活动，对于i2c总线，可以探测到起始和停止信号，传输字节，ackbit。
4.  sequence主要是reg write 进行寄存器配置。
