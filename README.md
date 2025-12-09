# gitFilter

## Описание
Инструмент для конвертации office-файлов в текстовый формат.

## Файлы проекта

### officeToTxt.sh
Bash-скрипт для конвертации различных форматов документов (PDF, DOC, DOCX, XLS, XLSX, PPT, PPTX и др.) в текстовый формат.

**Использование:**
```bash
./officeToTxt.sh <filename>
```

**Поддерживаемые форматы:**
- PDF (через pdftotext)
- DOC (через antiword/catdoc/pandoc)
- DOCX, ODT (через pandoc/LibreOffice)
- XLS (через xls2csv/ssconvert)
- XLSX, ODS (через ssconvert/LibreOffice)
- PPT (через catppt)
- PPTX, ODP (через pandoc/LibreOffice)
- TXT, CSV, MD, LOG (прямое чтение)

## Continuous Integration (CI)

Проект использует GitHub Actions для автоматической проверки качества кода.

### ShellCheck

При каждом push в ветки `main`, `master` или `develop` автоматически запускается проверка всех bash-скриптов с помощью [ShellCheck](https://www.shellcheck.net/).

**Что проверяется:**
- Синтаксические ошибки
- Потенциальные баги (неэкранированные переменные, проблемы с пробелами в именах файлов)
- Проблемы безопасности
- Соответствие best practices для bash

### Конфигурация CI

Файл конфигурации: `.github/workflows/shellcheck.yml`

```yaml
name: 'ShellCheck'
on:
  push:
    branches: [ main, master, develop ]
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: ludeeus/action-shellcheck@master
        with:
          scandir: '.'
      - run: shellcheck --version
```

