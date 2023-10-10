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

# Expose port need for Docker space on huggingface
EXPOSE 7860

# Copy current directory to /code in the container
COPY . .

# Copy SSH keys (Use cautiously)
COPY /home/taylorbollman/.ssh/taylorfirstkey /root/.ssh/taylorfirstkey
RUN chmod 600 /root/.ssh/taylorfirstkey



