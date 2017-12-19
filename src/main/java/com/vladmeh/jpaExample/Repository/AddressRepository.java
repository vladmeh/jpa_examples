package com.vladmeh.jpaExample.Repository;

import com.vladmeh.jpaExample.Entity.Address;
import org.springframework.data.repository.CrudRepository;

/**
 * @autor mvl on 19.12.2017.
 */
public interface AddressRepository extends CrudRepository<Address, Long>{
}
