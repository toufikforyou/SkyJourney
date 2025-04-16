import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.BindException;
import java.net.InetSocketAddress;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

public class Server {
    private static final int DEFAULT_PORT = 8000;
        
    public static void main(String[] args) {
        int port = DEFAULT_PORT;
        HttpServer server = null;
        
        // Try ports until we find an available one
        while (server == null && port < DEFAULT_PORT + 10) {
            try {
                server = HttpServer.create(new InetSocketAddress(port), 0);
            } catch (BindException e) {
                System.out.println("Port " + port + " is in use, trying next port...");
                port++;
            } catch (IOException e) {
                System.err.println("Failed to start server: " + e.getMessage());
                System.exit(1);
            }
        }
        
        if (server == null) {
            System.err.println("Could not find an available port. Please ensure ports " + DEFAULT_PORT + "-" + (DEFAULT_PORT + 9) + " are free.");
            System.exit(1);
        }

        server.createContext("/", new FileHandler());
        server.setExecutor(null);
        server.start();

        System.out.println("Server started successfully!");
        System.out.println("Access the website at: http://localhost:" + port);
    }

    static class FileHandler implements HttpHandler {
        private static final String WEBAPP_PATH = "src/main/webapp";
        
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            String path = exchange.getRequestURI().getPath();
            
            // Default to index.jsp if root path
            if (path.equals("/")) {
                path = "/index.jsp";
            }
            
            Path filePath = Paths.get(WEBAPP_PATH + path);
            File file = filePath.toFile();
            
            if (!file.exists()) {
                String response = "404 (Not Found)\n";
                exchange.sendResponseHeaders(404, response.length());
                try (OutputStream os = exchange.getResponseBody()) {
                    os.write(response.getBytes());
                }
                return;
            }
            
            // Set content type based on file extension
            String contentType = "text/html";
            if (path.endsWith(".css")) {
                contentType = "text/css";
            }
            exchange.getResponseHeaders().set("Content-Type", contentType + "; charset=UTF-8");
            
            // Send file contents as response
            byte[] response = Files.readAllBytes(filePath);
            exchange.sendResponseHeaders(200, response.length);
            try (OutputStream os = exchange.getResponseBody()) {
                os.write(response);
            }
        }
    }
}
