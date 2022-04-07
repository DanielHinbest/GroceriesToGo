package ca.groceriestogo.service;

import ca.groceriestogo.model.Product;
import ca.groceriestogo.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.util.List;

@Service
public class ProductService {

    @Autowired
    ProductRepository repo;


    public List<Product> search(String keyword) {
        return repo.search(keyword);
    }
}
