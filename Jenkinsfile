pipeline {
    agent any

    stages {
        stage('Checkout (Ingredientes)') {
            steps {
                echo 'Descargando la receta de BurgerCode...'
                checkout scm
            }
        }

        stage('Build (Cocinar)') {
            steps {
                echo 'Cocinando la imagen Docker...'
                sh 'docker build -t burgercode-app .'
            }
        }

        stage('Test (Control de Calidad)') {
            steps {
                echo 'Probando la hamburguesa...'
                // Ejecutamos el test DENTRO del contenedor para asegurar consistencia
                sh 'docker run --rm burgercode-app python test.py'
            }
        }

        stage('Deploy (Entrega)') {
            steps {
                echo 'Desplegando en Producción...'
                // Detenemos el contenedor anterior si existe para evitar conflictos de nombre/puerto
                sh 'docker rm -f burger-prod || true'
                sh 'docker run -d --name burger-prod -p 5000:5000 burgercode-app'
                echo '¡Hamburguesa servida en http://localhost:5000!'
            }
        }
    }
    
    post {
        success {
            echo '✅ ¡La hamburguesa está lista y servida perfectamente!'
        }
        failure {
            echo '❌ Algo salió mal en la cocina. Revisa los logs.'
        }
    }
}
