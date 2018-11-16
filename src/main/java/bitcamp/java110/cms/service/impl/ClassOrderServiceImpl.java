package bitcamp.java110.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.java110.cms.dao.ClassOrderDao;
import bitcamp.java110.cms.domain.ClassOrder;
import bitcamp.java110.cms.service.ClassOrderService;

@Service
public class ClassOrderServiceImpl implements ClassOrderService{

  @Autowired ClassOrderDao classorderDao;

  @Override
  public List<ClassOrder> corderlist(int pageSize) {
    
    HashMap<String, Object> params = new HashMap<>();
    params.put("size", pageSize);
    
    return classorderDao.orderlist(params);
  }
  
  @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
  @Override
  public void orderadd(ClassOrder classorder) {
    classorderDao.orderinsert(classorder);
  }
}