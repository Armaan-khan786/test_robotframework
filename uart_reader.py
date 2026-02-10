import serial
import time

def read_all_steps():
    print("Python started reading COM7...", flush=True)

    ser = serial.Serial("COM7", 115200, timeout=1)
    time.sleep(2)

    lines = []
    start = time.time()

    while time.time() - start < 60:
        if ser.in_waiting:
            line = ser.readline().decode(errors="ignore").strip()
            if line:
                print(line, flush=True)   # 🔥 Important for GitHub log
                lines.append(line)

    ser.close()
    return lines


if __name__ == "__main__":
    read_all_steps()
