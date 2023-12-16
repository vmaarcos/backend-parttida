package com.parttidafenix.fenixparttida;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

@SpringBootApplication
public class FenixParttidaApplication {

    public static void main(String[] args) {
        SpringApplication.run(FenixParttidaApplication.class, args);
    }
}

@RestController
@RequestMapping("/api") // http://localhost:8080/api (padrãoooo nn esquece)
class HelloController {

    @GetMapping("/get") // GET /api/get
    public String sayHello() {
        return "Macaco ti rei du java";
    }

    @PostMapping("/create") // POST /api/create
    public String create(@RequestBody String data) {
        // Lógica para criar um recurso com os dados fornecidos.
        return "Recurso Criado: " + data;
    }

    @PutMapping("/update/{id}") // PUT /api/update/o id aqui
    public String update(@PathVariable Long id, @RequestBody String data) {
        // Lógica para atualizar um recurso com os dados fornecidos.
        
        return "Atualizar recursos " + id + " data do update: " + data;
    }

    @DeleteMapping("/delete/{id}") // DELETE /api/delete/o id aqui
    public String delete(@PathVariable Long id) {
        
        return " Recurso Deletar " + id + " deletado com sucesso";
    }
}
