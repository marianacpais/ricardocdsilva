# Ricardo Carreira da Silva - CV

Welcome to the repository of **Ricardo Carreira da Silva's** curriculum vitae. This repository contains Ricardo's professional, academic, and skills details, formatted in YAML for use with **RenderCV**.

## 📄 About the CV

The main curriculum file is structured in YAML format to ensure compatibility with RenderCV. It includes the following sections:
- **Education** 🎓
- **Professional Experience** 💼
- **Skills** 🛠️
- **Certifications** 📜
- **Extracurricular Activities** 🎯
- **Interests** 🔍
- **Driving License** 🚗

## 📂 Repository Structure

```
📁 cv_ricardo_silva
 ├── cv/                 # Folder containing all YAML CV files
 ├── README.md            # This file
 ├── mkdocs.yml           # MkDocs configuration file
 ├── Makefile             # Automation commands for rendering and serving
 └── assets/              # Additional resources (if necessary)
```

## 🛠️ How to Use

This repository provides a **Makefile** to simplify working with RenderCV and MkDocs.

### 🔹 Rendering the CV(s)
To render all CV files inside the `cv/` directory:
```bash
make render
```
This will process all `.yaml` files inside `cv/` and generate output files with the same name (without extensions).

To render a specific CV file:
```bash
make render CV_FILE=cv/your-cv-file.yaml
```

### 🔹 Running MkDocs Locally
To start a local development server for MkDocs:
```bash
make serve
```
This will allow you to preview the documentation locally.

## 🌍 Location & Language

The CV is configured to be displayed in **Portuguese** (`locale: pt`). If you need to change it to another language, edit the `locale` field in the corresponding YAML file.

## 📫 Contact

For more information or suggestions for improvements, please contact:
- 📧 Email: [ricardo.carreira.silva@gmail.com](mailto:ricardo.carreira.silva@gmail.com)
- 🔗 LinkedIn: [Ricardo Carreira da Silva](https://www.linkedin.com/in/ricardocarreira-dasilva)

---
📌 _This repository was created to store and organize Ricardo Carreira da Silva's CV in a practical and reusable way._
