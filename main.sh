if ! command -v qemu-system-x86_64 &> /dev/null
then
    install-pkg qemu
fi

osNames=("win11fixed.iso")

for i in ${!osNames[@]}; do
    echo -e "\e[2m${osNames[i]}:\e[0m ${i}"
done

read -p "Choose os: " osIndex
os=${osNames[$osIndex]}
echo "Booting from $os..."

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.

if [ "$osIndex" = "2" ];
then
qemu-system-x86_64 os/$os
else
qemu-system-x86_64 --cdrom os/$os
fi
