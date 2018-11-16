package bitcamp.java110.cms.dao;

import java.util.List;
import java.util.Map;
import bitcamp.java110.cms.domain.ClassOrder;

public interface ClassOrderDao {
  List<ClassOrder> orderlist(Map<String,Object> params);
  int orderinsert(ClassOrder corder);
}