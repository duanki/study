package com.team.mapper;

import com.team.entity.District;
import com.team.entity.DistrictExample;
import java.util.List;

public interface DistrictMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(District record);

    int insertSelective(District record);

    List<District> selectByExample(DistrictExample example);

    District selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(District record);

    int updateByPrimaryKey(District record);

    int deleteDistrictByDid(Integer id);

    int deleteMoreDistrict(List<Integer> ids);
}