# README do Projeto Terraform

Este projeto Terraform automatiza a criação de recursos na AWS, incluindo buckets S3 e funções Lambda. Ele é configurado para facilitar o gerenciamento de dados e realizar cópias de segurança automaticamente.

## Case de uso
- Podemos usar em casos de multi-account ou até mesmo para transferir para outra região.

## Estrutura do Projeto

- **main.tf**: Define os providers e sources.
- **bucket.tf**: Define os bucket s3.
- **notify.tf**: Aplica uma notificação no bucket S3 principal.
- **permission.tf**: Define a permissão do lambda para comunica-se com S3
- **policy.tf**: Define as politicas a ser aplicadas no lambda e no s3 e a criação de roles
- **lambda.tf**: Faz o Upload do zip em lambda/lambda_function.zip para aws
- **variables.tf**: Declara as variáveis utilizadas para personalizar os nomes dos buckets S3.
- **output.tf**: Especifica as saídas que serão exibidas após a aplicação do Terraform.
- **lambda/lambda_function.zip**: Contém o projeto da automação em 'JS'

## Recursos Criados

### 1. Buckets S3

- **Bucket Principal**: 
  - Nome: O nome é definido pela variável `aws_s3_bucket`.
  - Função: Armazena dados principais que podem ser utilizados por aplicações.

- **Bucket de Backup**: 
  - Nome: O nome é definido pela variável `aws_s3_bucket_bk`.
  - Função: Armazena cópias de segurança dos dados do bucket principal.

### 2. Função Lambda

- **Nome da Função**: `norman-lambda-2024"`
- **Runtime**: Node.js 18.x
- **Código**: A função deve estar disponível em um arquivo zip (`lambda/lambda_function.zip`).
- **Descrição**: A função Lambda é acionada sempre que um novo objeto é criado no bucket S3 principal, copiando automaticamente o objeto para o bucket de backup.

### 3. IAM Role e Policies

- **Role para Lambda**: Cria uma role IAM que permite à função Lambda ser executada.
- **Políticas IAM**: Concede permissões para a função Lambda realizar operações no S3, como `GetObject`, `PutObject`, e `CopyObject`.

### 4. Notificações S3

- Configura uma notificação no bucket S3 principal que chama a função Lambda sempre que um novo objeto é adicionado, permitindo a cópia automática para o bucket de backup.

## Variáveis

As seguintes variáveis podem ser definidas no arquivo `variables.tf`:

```hcl
variable "aws_s3_bucket" {
  description = "Nome do bucket S3 principal"
  type        = string
  default     = "Name-bucket"
}

variable "aws_s3_bucket_bk" {
  description = "Nome do bucket S3 de backup"
  type        = string
  default     = "Name-bucket"
}
```
## Como Usar

   ```bash
   terraform init
   terraform validate # - para validação
   terraform plan     # - para verificação dos recursos
   terraform apply    # - para aplicação do projeto
```