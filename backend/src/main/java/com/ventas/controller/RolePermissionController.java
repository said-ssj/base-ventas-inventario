package com.ventas.controller;
import com.ventas.dto.RoleModels.*;import com.ventas.security.AuthModels.Identity;import com.ventas.service.RolePermissionService;import jakarta.servlet.http.HttpServletRequest;import jakarta.validation.Valid;import org.springframework.context.annotation.Profile;import org.springframework.security.core.annotation.AuthenticationPrincipal;import org.springframework.web.bind.annotation.*;
@RestController @Profile("db") @RequestMapping("/api/roles") public class RolePermissionController{
 private final RolePermissionService service;public RolePermissionController(RolePermissionService service){this.service=service;}
 @GetMapping("/{id}/permisos") public Editor get(@AuthenticationPrincipal Identity a,@PathVariable long id){return service.get(a,id);}
 @PutMapping("/{id}/permisos") public Result save(@AuthenticationPrincipal Identity a,@PathVariable long id,@Valid @RequestBody Change input,HttpServletRequest r){return service.save(a,r.getRemoteAddr(),id,input);}
}
