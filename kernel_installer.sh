#!/bin/bash

# Create directory for the kernel
mkdir -p ~/.local/share/jupyter/kernels/mgltools_py2

# Create kernel.json file
cat > ~/.local/share/jupyter/kernels/mgltools_py2/kernel.json << 'EOF'
{
 "display_name": "Python 2 (MGLTools)",
 "language": "python",
 "argv": [
  "/home/imraan/miniforge3/envs/mgltools_py2/bin/python2",
  "-m",
  "ipykernel_launcher",
  "-f",
  "{connection_file}"
 ],
 "env": {
  "PYTHONPATH": "/home/imraan/Jupyter_Dock/mgltools_x86_64Linux2_1.5.7/MGLToolsPckgs"
 }
}
EOF

# Make the script executable
chmod +x ~/.local/share/jupyter/kernels/mgltools_py2/kernel.json

echo "MGLTools Python 2 kernel installed successfully!"
echo "You should now be able to select 'Python 2 (MGLTools)' in Jupyter Notebook/Lab."

