bu handzone da onemli komutlar
burada subnetlerin altinda ec2 acarken 
public ve private ec2 larda 
key lerimizi  otomatik kopyalama yapmadan calistirmak icin alttaki comutlari sirasiyla calistir
eval "$(ssh-agent)"  #bu komutla arka planda keyimizi calistiriyoruz
ssh-add ./[your pem file name] # bu komutla ssh a ekleme yapiyoruz
ssh -A ec2-user@ec2-3-88-199-43.compute-1.amazonaws.com  # bu komutla ssh ile puplic ec2 ya baglaniyoruz
ssh ec2-user@[Your private EC2 private IP] # bu komutla private ec2 yani alt private subnete baglaniyoruz

bu komut onemli
bir ec2 da alt subnete baglanirken keypair gerekli ve bu komutla localde bu komutu calistirarak baglanacagimiz tum ec2 subnetlere baglanabiliyoruz cunku bu komut keypair imizi arka planda calistiriyor