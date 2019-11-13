package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Picture;

public interface PictureDao {
	List<Picture> selectByPKid(Map<String, Object> map);
}
