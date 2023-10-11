# Use Hugging Face's PyTorch GPU image as base
FROM huggingface/transformers-pytorch-gpu

# Set working directory
WORKDIR /code

# Install git (Optional)
RUN apt-get update && apt-get install -y git

# Copy only the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /code/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy current directory to /code in the container
COPY . .

# Copy SSH public key for incoming SSH
COPY /home/taylorbollman/.ssh/authorized_keys /root/.ssh/authorized_keys








