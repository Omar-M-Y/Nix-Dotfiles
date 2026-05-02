# Bluetooth.nix
{ ... }: {

system.activationScripts.bluetooth-sync = {
  text = ''
    ADAPTER="EC:63:D7:46:78:54"
    DEVICE="B4:AE:C1:BF:2C:B0"
    DIR="/var/lib/bluetooth/$ADAPTER/$DEVICE"

    mkdir -p "$DIR"

    cat <<EOF > "$DIR/info"
    [General]
    Name=Yahya’s iPhone
    Class=0x7a020c
    SupportedTechnologies=BR/EDR;
    Trusted=true
    Blocked=false
    CablePairing=false
    Services=00000000-deca-fade-deca-deafdecacafe;00001000-0000-1000-8000-00805f9b34fb;0000110a-0000-1000-8000-00805f9b34fb;0000110c-0000-1000-8000-00805f9b34fb;0000110e-0000-1000-8000-00805f9b34fb;00001116-0000-1000-8000-00805f9b34fb;0000111f-0000-1000-8000-00805f9b34fb;0000112f-0000-1000-8000-00805f9b34fb;00001132-0000-1000-8000-00805f9b34fb;00001200-0000-1000-8000-00805f9b34fb;00001801-0000-1000-8000-00805f9b34fb;02030302-1d19-415f-86f2-22a2106a0a77;1ff31936-572e-4b36-a2bf-b2409b1aa6f4;2d8d2466-e14d-451c-88bc-7301abea291a;

    [LinkKey]
    Key=70B50757D92138B249FD84DD00DF0896
    Type=8
    PINLength=0

    [DeviceID]
    Source=1
    EOF

    chmod 600 "$DIR/info"
    chown -R root:root /var/lib/bluetooth
  '';
};
}
