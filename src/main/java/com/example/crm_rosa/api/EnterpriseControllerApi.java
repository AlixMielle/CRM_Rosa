package com.example.crm_rosa.api;

import com.example.crm_rosa.api.base.BaseControllerApi;
import com.example.crm_rosa.controller.dto.CreateEnterprise;
import com.example.crm_rosa.repository.entity.Enterprise;
import com.example.crm_rosa.service.EnterpriseService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
public class EnterpriseControllerApi extends BaseControllerApi {

    private EnterpriseService enterpriseService;

    public EnterpriseControllerApi(EnterpriseService enterpriseService) {
        this.enterpriseService = enterpriseService;
    }

    @GetMapping(value = "/enterprises", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<EnterpriseDto>> getAllEnterprises(){
       List<Enterprise> enterpriseList = this.enterpriseService.findAllEnterprises();

       List<EnterpriseDto> enterpriseDtoList = enterpriseList
               .stream()
               .map(enterprise -> EnterpriseDto.from(enterprise))
               .collect(Collectors.toList());

       return new ResponseEntity<>(enterpriseDtoList, HttpStatus.OK);
    }

    @PostMapping(value = "/enterprises", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<EnterpriseDto> createEnterprise(@RequestBody CreateEnterprise createEnterprise){
        this.enterpriseService.addEnterprise(createEnterprise);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

}
