select * from portofol..Nashville;

-- standerdize saledate

select SaleDateConverted, convert(date, SaleDate) 
from portofol..Nashville;

alter table Nashville
add SaleDateConverted date;

update Nashville
set SaleDateConverted = convert(date, SaleDate);

-- populate property address

select a.parcelid, a.propertyaddress, b.parcelid, b.propertyaddress, ISNULL(a.propertyaddress,b.PropertyAddress)
from portofol..Nashville a
join portofol..Nashville b 
on a.ParcelID = b.ParcelID and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null ;

update a
set propertyaddress = ISNULL(a.propertyaddress,b.PropertyAddress)
from portofol..Nashville a
join portofol..Nashville b 
on a.ParcelID = b.ParcelID and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null ;


-- breaking out address

select substring(propertyaddress,1, CHARINDEX(',' ,propertyaddress)-1) as PropAddress,
       substring(propertyaddress, CHARINDEX(',',propertyaddress)+1, LEN(propertyaddress)) as PropertyCity
from Nashville;

alter table Nashville
add PropAddress nvarchar(255),
    PropertyCity nvarchar(255);

update Nashville
set PropAddress = substring(propertyaddress,1, CHARINDEX(',' ,propertyaddress)-1),
    PropertyCity = substring(propertyaddress, CHARINDEX(',',propertyaddress)+1, LEN(propertyaddress));


select owneraddress,
       substring(OwnerAddress,1, CHARINDEX(',' ,propertyaddress)-1) as PropAddress,
       substring(OwnerAddress, CHARINDEX(',',propertyaddress)+1, LEN(propertyaddress)) as PropertyCity
from Nashville;


select owneraddress,
      parsename(REPLACE(OwnerAddress,',', '.'),3) as ownAddress,
      parsename(REPLACE(OwnerAddress,',', '.'),2) as owncity, 
	  parsename(REPLACE(OwnerAddress,',', '.'),1) as ownstate
from Nashville;

alter table Nashville
add OwnAddress nvarchar(255),
    OwnCity nvarchar (255),
    OwnState nvarchar (255);

update Nashville
set   OwnAddress = parsename(REPLACE(OwnerAddress,',', '.'),3),
      OwnCity =  parsename(REPLACE(OwnerAddress,',', '.'),2) , 
	  OwnState = parsename(REPLACE(OwnerAddress,',', '.'),1) ;


-- change y and n to yes and no

select distinct (SoldAsVacant) , count(SoldAsVacant)
from portofol..Nashville
group by SoldAsVacant;

select SoldAsVacant,
Case when SoldAsVacant = 'n' then 'No'
     when SoldAsVacant = 'y' then 'Yes'
	 else SoldAsVacant
	 end
from Nashville;

update Nashville
set SoldAsVacant = Case when SoldAsVacant = 'n' then 'No'
     when SoldAsVacant = 'y' then 'Yes'
	 else SoldAsVacant
	 end