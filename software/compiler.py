def generate_output(dec1, dec2, dec3, dec4, hex1, hex2, hex3, operation):
    # 确保输入的十进制数不超过9位
    if not (0 <= dec1 < 512) or not (0 <= dec2 < 512):
        raise ValueError("Decimal inputs must be less than 512")
    
    # 确保输入的16进制数都是32位
    if len(hex(hex1)[2:]) > 8 or len(hex(hex2)[2:]) > 8 or len(hex(hex3)[2:]) > 8:
        raise ValueError("Hexadecimal inputs must be 32-bit numbers")
    
    # 将16进制数转换为整数
    num1 = int(hex1)
    num2 = int(hex2)
    num3 = int(hex3)
    
    # 设置输出的最高4位
    if operation == "ADD":
        high_bits = 0x1
    elif operation == "CONV":
        high_bits = 0x7
    elif operation == "POOL":
        high_bits = 0x8
    else:
        high_bits = 0x0
    
    # 将值放置在128位输出中的正确位置
    output = (high_bits << 124) | (dec2 << 19) | (dec1 << 10) | (num3 << 92) | (num2 << 60) | (num1 << 28) | (dec3 << 5) | dec4
    
    # 返回128位数的十六进制表示
    return f'{output:032x}'

# 示例输入
row1 = 3  
col1 = 3
row2 = 3  
col2 = 3    
hex1 = 0x00024080  # dest
hex2 = 0x00022100  # src2
hex3 = 0x00020200  # src1
operation = "ADD"  


output_hex = generate_output(row1, col1, row2, col2, hex1, hex2, hex3, operation)
print(output_hex)

row1 = 26  
col1 = 26   
row2 = 2  
col2 = 2   
hex2 = 0x00000000  # src2
hex3 = 0x00018000  # src1
operation = "POOL"  


output_hex = generate_output(row1, col1, row2, col2, hex1, hex2, hex3, operation)
print(output_hex)