cont = -1
labels = []

class Label:

    def __init__(self, name, line):
        self.name = name
        self.line = line



def getInstructionCode(instruction):
    switcher = {
        "sum" : "0000",
        "res": "0001",
        "mul": "0010", 
        "div": "0011",
        "and" : "0100",
        "or " : "0101",
        "not" : "0110",
        "sto" : "1100",
        "sme" : "1101",
        "si " : "1110",
        "sma" : "1111",
        "cmp" : "1000",
        "ld " : "1001",
        "sr " : "1010"
    }
 
    return switcher.get(instruction, "Invalid instruction")

def getRegisterCode(register):
    switcher = {
        "R0" : "0000",
        "R1": "0001",
        "R2": "0010", 
        "R3": "0011",
        "R4" : "0100",
        "R5" : "0101",
        "R6" : "0110",
        "R7" : "0111",
        "R8" : "1000",
        "R9" : "1001",
        "R10" : "1010",
        "R11" : "1011",
        "R12" : "1100",
        "R13" : "1101",
        "R14" : "1110",
        "R15" : "1111"
        }
 
    return switcher.get(register, "Invalid register")

def decimal_a_binario(decimal):
    if decimal <= 0:
        return "0"
    # Aquí almacenamos el resultado
    binario = ""
    # Mientras se pueda dividir...
    while decimal > 0:
        # Saber si es 1 o 0
        residuo = int(decimal % 2)
        # E ir dividiendo el decimal
        decimal = int(decimal / 2)
        # Ir agregando el número (1 o 0) a la izquierda del resultado
        binario = str(residuo) + binario
    return binario

def get3OpInstructionCode(instruction):
    code =  "	" + str(cont) +":"+ getInstructionCode(instruction[0:3])
    instruction = instruction[instruction.find("R"):].replace("\n", "")
    code = code + getRegisterCode(instruction[0:3].replace(" ", "").replace(",", ""))
    instruction = instruction[instruction.find("R",1):]
    code = code + getRegisterCode(instruction[0:3].replace(" ", "").replace(",", ""))
    if instruction.find(",") == -1:
        code = code  + "000000000001;"
        f2.write(code)
        f2.write("\n")
    else: 
        instruction = instruction[instruction.find(",")+1:].replace(" ", "")
        if instruction.find("R") == -1:
    
            if len(decimal_a_binario(int(instruction))) > 8:
                code = code + "Invalid Inmediate"
            else:
            
                inmediate = decimal_a_binario(int(instruction))
                while len(inmediate) < 8:
                    inmediate = "0" + inmediate
                
                code = code + inmediate + "0001;"
            f2.write(code)
            f2.write("\n")
        else:
            code = code + getRegisterCode(instruction[0:3].replace("\n", "")) + "00000000;"
            f2.write(code)
            f2.write("\n")
def get2OpInstructionCode(instruction):
    global cont
    code =  "	" + str(cont) +":"+ getInstructionCode(instruction[0:3])
    instruction = instruction[instruction.find("R"):].replace("\n", "")
    code = code + getRegisterCode(instruction[0:3].replace(" ", "").replace(",", ""))
    instruction = instruction[instruction.find(",")+1:].replace(" ", "")
    if instruction.find("R") == -1:
    
        if len(decimal_a_binario(int(instruction))) > 8:
            code = code + "Invalid Inmediate"
        else:
            inmediate = decimal_a_binario(int(instruction))
            while len(inmediate) < 8:
                inmediate = "0" + inmediate
                
            code = code + "0000" + inmediate + "0001;"
            f2.write(code)
            f2.write("\n")
    else:
        code = code + getRegisterCode(instruction[0:3].replace("\n", "")) + "000000000000;"
        f2.write(code)
        f2.write("\n")
    instructionType("or R0, R0,R0")
    instructionType("or R0, R0,R0")
    instructionType("or R0, R0,R0")

def get1OpInstructionCode(instruction):
    global labels
    code =  "	" + str(cont) +":"+ getInstructionCode(instruction[0:3])
    instruction = instruction[instruction.find(" ")+1:].replace(" ", "")
    if instruction.find("_") != -1:    
        for label in labels: 
            if label.name == instruction:
                instruction = label.line
    
    if len(decimal_a_binario(int(instruction))) > 8:
        code = code + "Invalid Inmediate or label"
    else:
        inmediate = decimal_a_binario(int(instruction))
        while len(inmediate) < 8:
            inmediate = "0" + inmediate
        code = code + inmediate + "000000000001;"
        f2.write(code)
        f2.write("\n")
    instructionType("or R0, R0,R0")
    instructionType("or R0, R0,R0")

def getLDSROpInstructionCode(instruction):
    if instruction.find("+") == -1:
        get2OpInstructionCode(instruction)
    else:
        code =  "	" + str(cont) +":"+ getInstructionCode(instruction[0:3])
        instruction = instruction[instruction.find("R"):].replace("\n", "")
        code = code + getRegisterCode(instruction[0:3].replace(" ", "").replace(",", ""))
        instruction = instruction[instruction.find("R",1):]
        code = code + getRegisterCode(instruction[0:3].replace(" ", "").replace(",", ""))
        instruction = instruction[instruction.find("+")+1:].replace(" ", "")
        if instruction.find("R") == -1:
        
            if len(decimal_a_binario(int(instruction))) > 8:
                code = code + "Invalid Inmediate"
            else:
                
                inmediate = decimal_a_binario(int(instruction))
                while len(inmediate) < 8:
                    inmediate = "0" + inmediate
                    
                code = code + inmediate + "0010;"
            f2.write(code)
            f2.write("\n")
        else:
            code = code + "0000" + getRegisterCode(instruction[0:3].replace("\n", "")) + "0011;"
            f2.write(code)
            f2.write("\n")
    
def instructionType(instruction):
    global cont
    global labels
    if instruction[0:3] =='sum' or instruction[0:3] =='res'or instruction[0:3] =='mul'or instruction[0:3] =='div' or instruction[0:3] =='and'or instruction[0:3] =='or 'or instruction[0:3] =='not':
        cont = cont +1
        get3OpInstructionCode(instruction)
    elif instruction[0:3] =='cmp':
        cont = cont +1 
        get2OpInstructionCode(instruction)
        cont = cont +1
    elif instruction[0:3] =='sto' or instruction[0:3] =='sme' or instruction[0:3] =='si '  or instruction[0:3] =='sma':
        cont = cont +1
        get1OpInstructionCode(instruction)
    elif instruction[0:3] =='ld ' or instruction[0:3] =='sr ':
        cont = cont +1
        getLDSROpInstructionCode(instruction)
    else:
        label = Label(instruction.replace(":", "").replace(" ", ""), cont +1)
        labels.append(label)
        


f = open("instructions.txt", "r")
f2 = open ("Binary.txt","w")
f2.write("WIDTH=24;\n")
f2.write("DEPTH=65536;\n")
f2.write("\n")
f2.write("ADDRESS_RADIX=UNS;\n")
f2.write("DATA_RADIX=BIN;\n")
f2.write("\n")
f2.write("CONTENT BEGIN")
f2.write("\n")




for linea in f:

    instructionType(linea)
f2.write("	[" + str(cont+1) + "..65535]: 000000000000000000000000;")
f2.write("\n")
f2.write("END;")
print("Completado")

f.close()

f2.close()

